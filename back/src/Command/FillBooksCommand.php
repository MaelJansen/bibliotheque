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
        print(($response->getContent()));
        $io->success('You have a new command! Now make it your own! Pass --help to see your options.');

        return Command::SUCCESS;
    }
}
