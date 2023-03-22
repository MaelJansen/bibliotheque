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
            ->addArgument('nbLivres', InputArgument::OPTIONAL, 'Number of books you want to add')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $nbLivres = $input->getArgument('nbLivres');
        $this->client->request(
            'GET',
            'https://www.googleapis.com/books/v1/volumes',
            [
                'query' => [
                    'maxResults' => 40,
                    'q' => 'a',
                ],
            ]
        );

        if ($nbLivres && $nbLivres < 40 && $nbLivres > 0) {
            $io->note(sprintf('You passed an argument: %s', $nbLivres));
        }


        $io->success('You have a new command! Now make it your own! Pass --help to see your options.');

        return Command::SUCCESS;
    }
}
