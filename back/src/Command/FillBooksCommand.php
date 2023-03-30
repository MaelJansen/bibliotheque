<?php

namespace App\Command;

use App\Entity\Author;
use App\Entity\Book;
use App\Entity\Editor;
use App\Entity\Language;
use App\Entity\Categories;
use App\Repository\AuthorRepository;
use App\Repository\BookRepository;
use App\Repository\CategoriesRepository;
use App\Repository\EditorRepository;
use DateTime;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Contracts\HttpClient\HttpClientInterface;
use Doctrine\DBAL\Logging\DebugStack;
use PhpParser\Node\Expr\Cast\String_;
use Symfony\Component\Validator\Constraints\Date;
use Symfony\Contracts\HttpClient\ResponseInterface;

#[AsCommand(
    name: 'app:fill-books',
    description: 'Command to fill the database with books and all the related data',
)]
/**
 * Summary of FillBooksCommand
 */
class FillBooksCommand extends Command
{
    private $logger;
    private $client;
    private $entityManager;
    private $lanRepository;
    private AuthorRepository $authorRepository;
    private CategoriesRepository $categoriesRepository;
    private BookRepository $bookRepository;
    private EditorRepository $editorRepository;

    /**
     * Used to create the command and to set the different repositories
     * @param HttpClientInterface $client
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(HttpClientInterface $client, EntityManagerInterface $entityManager)
    {
        $this->entityManager = $entityManager;
        // Setting the different repositories
        $this->bookRepository = $entityManager->getRepository(Book::class);
        $this->categoriesRepository = $entityManager->getRepository(Categories::class);
        $this->authorRepository = $entityManager->getRepository(Author::class);
        $this->editorRepository = $entityManager->getRepository(Editor::class);
        $this->lanRepository = $entityManager->getRepository(Language::class);
        $this->client = $client;
        parent::__construct();
    }

    /**
     * Used to configure the command
     * @return void
     */
    protected function configure(): void
    {
        $this
            ->addArgument('nbBooks', InputArgument::OPTIONAL, 'Number of books you want to add')
            ->addArgument('search', InputArgument::OPTIONAL, 'Search for a book or author')
            ->setDescription('This function is used to fill the database with books from the api google books');
    }


    /**
     * Used to create all the books which are in the response
     * @param ResponseInterface $response the books from the api
     * @return void
     */
    public function addingBookResults(ResponseInterface $response)
    {
        // Going through all the books of the response
        foreach ($response->toArray()["items"] as $book) {
            print($book['volumeInfo']['title']);
            if (!$this->bookRepository->findOneBy(['BOOName' => $book['volumeInfo']['title']])) {
                // Create a new book
                $createdBook = new Book();
                $createdBook->__construct();

                // If there is an author given by the api and if it's not already in the database, create it and add it
                if (array_key_exists('authors', $book['volumeInfo'])) {
                    $nbAuthors = count($book['volumeInfo']['authors']);
                    // If there is more than one author, add them all
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
                    $foundLanguage = $this->lanRepository->findOneBy(['LANName' => $book['volumeInfo']['language']]);
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
                if (array_key_exists('publishedDate', $book['volumeInfo'])) {
                    $date = DateTime::createFromFormat('Y-m-d', $book['volumeInfo']['publishedDate']);
                    if ($date == false) {
                        $date = DateTime::createFromFormat('Y', $book['volumeInfo']['publishedDate']);
                        if ($date != false) {
                            $date->setDate($date->format("Y"), 01, 01);
                        } else {
                            $date = null;
                        }
                    }
                    $createdBook->setBOOPublishDate($date);
                }
                if ($createdBook->getBOOPublishDate() != null) {
                    $receivedDate = new DateTime();
                    $minDate = $date->getTimestamp();
                    if ($minDate < strtotime("01-01-2010")) {
                        $minDate = strtotime("01-01-2010");
                    }
                    $maxDate = time();
                    $randStamp = rand($minDate, $maxDate);
                    $receivedDate->setDate(date("Y", $randStamp), date("m", $randStamp), date("d", $randStamp));
                    $createdBook->setBOOReceivingDate($receivedDate);
                } else {
                    $receivedDate = new DateTime();
                    $minDate = strtotime("01-01-2010");
                    $maxDate = time();
                    $randStamp = rand($minDate, $maxDate);
                    $receivedDate->setDate(date("Y", $randStamp), date("m", $randStamp), date("d", $randStamp));
                    $createdBook->setBOOReceivingDate($receivedDate);
                }
                $createdBook->setBOOName($book['volumeInfo']['title']);

                //Add book to database
                $this->entityManager->persist($createdBook);
                $this->entityManager->flush();
            }
        }
    }

    /**
     * Used to execute the command
     * @param InputInterface $input
     * @param OutputInterface $output
     * @return int
     */
    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $this->logger = new DebugStack();
        $this->entityManager->getConnection()->getConfiguration()->setSQLLogger($this->logger);

        $io = new SymfonyStyle($input, $output);
        // Get the number of books to add
        $nbBooks = $input->getArgument('nbBooks');
        // Get the search
        $search = $input->getArgument('search');

        // Check if the number of books is valid
        // If not, return an error
        if ($nbBooks && $nbBooks < 0) {
            $io->error("You can't add less than 0 books");
            return Command::FAILURE;
        }

        // Set the parameters for the request
        // If the number of books is not set, set it to 40
        // If the search is not set, set it to "all"
        $params = [
            'maxResults' => 40,
            'q' => "all",
        ];
        // If the number of books is set, add it to the parameters
        if ($nbBooks && $nbBooks < 40) {
            $io->note(sprintf('Number of books : %s', $nbBooks));
            $params['maxResults'] = $nbBooks;
        }
        // If the search is set, add it to the parameters
        if ($search && $search != "") {
            $io->note(sprintf('Research : %s', $search));
            $params['q'] = $search;
        }

        // Loop to get all the requested books
        for ($i = 0; $i <= $nbBooks / 40; $i++) {
            $params['startIndex'] = $i * 40;
            $response = $this->client->request(
                'GET',
                'https://www.googleapis.com/books/v1/volumes',
                [
                    'query' => $params,
                ]
            );
            // We check if there is a response
            if (array_key_exists("items", $response->toArray())) {
                $this->addingBookResults($response);
            }
        }

        $io->success('The books have been added to the database');

        return Command::SUCCESS;
    }
}
