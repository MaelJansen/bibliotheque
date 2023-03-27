<?php

namespace App\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Contracts\HttpClient\HttpClientInterface;

#[AsCommand(
    name: 'app:fill-books',
    description: 'Add a short description for your command',
)]
class FillBooksCommand extends Command
{
    private $client;

    public function __construct(HttpClientInterface $client)
    {
        $this->client = $client;
        parent::__construct();
    }

    protected function configure(): void
    {
        $this
            ->addArgument('nbBooks', InputArgument::OPTIONAL, 'Number of books you want to add')
            ->addArgument('search', InputArgument::OPTIONAL, 'Search for a book')
            ->setDescription('This function is used to fill the database with books from the api google books')

        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $nbBooks = $input->getArgument('nbBooks');
        $search = $input->getArgument('search');

        if ($nbBooks && $nbBooks > 40) {
            $io->error("You can't add more than 40 books");
            return Command::FAILURE;
        }
        
        $params = [
            'maxResults' => 40,
            'q' => "a",
        ];

        if ($nbBooks && $nbBooks < 40 && $nbBooks > 0) {
            $io->note(sprintf('Number of books : %s', $nbBooks));
            $params['maxResults'] = $nbBooks;
        }
        if ($search && $search != "") {
            $io->note(sprintf('Research : %s', $search));
            $params['q'] = $search;
        }
        $response = $this->client->request(
            'GET',
            'https://www.googleapis.com/books/v1/volumes',
            [
                'query' => $params,
            ]
        );

        foreach ($response->toArray()["items"] as $book) {
            print($book['volumeInfo']['title']);
            $createdBook = new Book();
            $createdBook->construct();

            //Add authors
            if (array_key_exists('authors', $book['volumeInfo'])) {
                $nbAuthors = count($book['volumeInfo']['authors']);
                for ($autIndex = 0; $autIndex < $nbAuthors; $autIndex++) {
                    $foundAuthor = $this->authorRepository->findOneBy(
                        ['AUTName' => $book['volumeInfo']['authors'][$autIndex]]
                    );
                    if ($foundAuthor) {
                        $createdBook->addBOOAuthor($foundAuthor);
                    } else {
                        $createdAuthor = new Author();
                        $createdAuthor->setAUTName($book['volumeInfo']['authors'][$autIndex]);
                        $createdBook->addBOOAuthor($createdAuthor);
                        $this->entityManager->persist($createdAuthor);
                    }
                }
            }

            //Add categories
            if (array_key_exists('categories', $book['volumeInfo'])) {
                $foundCat = $this->categoriesRepository->findOneBy(
                    ['CATName' => $book['volumeInfo']['categories'][0]]
                );
                if ($foundCat) {
                    $createdBook->setBOOCategory($foundCat);
                } else {
                    $createdCat = new Categories();
                    $createdCat->setCATName($book['volumeInfo']['categories'][0]);
                    $createdBook->setBOOCategory($createdCat);
                    $this->entityManager->persist($createdCat);
                }
            }


            //Add languages
            if (array_key_exists('language', $book['volumeInfo'])) {
                $foundLanguage = $this->languageRepository->findOneBy(['LANName' => $book['volumeInfo']['language']]);
                if ($foundLanguage) {
                    $createdBook->addBOOLanguage($foundLanguage);
                } else {
                    $createdLanguage = new Language();
                    $createdLanguage->setLANName($book['volumeInfo']['language']);
                    $createdBook->addBOOLanguage($createdLanguage);
                    $this->entityManager->persist($createdLanguage);
                }
            }

            //Add editor
            if (array_key_exists('publisher', $book['volumeInfo'])) {
                $foundEdi = $this->editorRepository->findOneBy(['EDIName' => $book['volumeInfo']['publisher']]);
                if ($foundEdi) {
                    $createdBook->setBOOEditor($foundEdi);
                } else {
                    $createdEditor = new Editor();
                    $createdEditor->setEDIName($book['volumeInfo']['publisher']);
                    $createdBook->setBOOEditor($createdEditor);
                    $this->entityManager->persist($createdEditor);
                }
            }



            //Add book infos
            if (array_key_exists('pageCount', $book['volumeInfo'])) {
                $createdBook->setBOONbPages($book['volumeInfo']['pageCount']);
            }
            if (array_key_exists('description', $book['volumeInfo'])) {
                $createdBook->setBOOSummary($book['volumeInfo']['description']);
            }
            if (array_key_exists('imageLinks', $book['volumeInfo'])) {
                $createdBook->setBOOLinkImg($book['volumeInfo']['imageLinks']['thumbnail']);
            }
            $createdBook->setBOOName($book['volumeInfo']['title']);

            //Add book to database
            $this->entityManager->persist($createdBook);
            $this->entityManager->flush();
        }
        $io->success('The books have been added to the database');

        return Command::SUCCESS;
    }
}
