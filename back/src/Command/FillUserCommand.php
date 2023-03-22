<?php

namespace App\Command;

use Symfony\Component\Console\Attribute\AsCommand;
use Symfony\Component\Console\Command\Command;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
use Symfony\Component\Console\Output\OutputInterface;
use Symfony\Component\Console\Style\SymfonyStyle;
use Symfony\Contracts\HttpClient\HttpClientInterface;

#[AsCommand(
    name: 'app:fill-user',
    description: 'Add a short description for your command',
)]
class FillUserCommand extends Command
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
            ->setDescription("This function is used to fill the database with user from the api randomuser.me")
            ->addArgument('nbUser', InputArgument::OPTIONAL, 'Number of user you want to create')
        ;
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        $arg1 = $input->getArgument('nbUser');
        $response = $this->client->request(
            'GET',
            'https://randomuser.me/api/',
            [
                'query' => [
                    'results' => $arg1,
                    'nat' => 'fr',
                    'results' => 50,
                    'inc' => 'name,email,picture,login',
                ],
            ]
        );


        if ($arg1) {
            $io->note(sprintf('You passed an argument: %s', $arg1));
            $response = $this->client->request(
                'GET',
                'https://randomuser.me/api/',
                [
                    'query' => [
                        'nat' => 'fr',
                        'results' => $arg1,
                        'inc' => 'name,email,picture,login',
                    ],
                    
                ]
            
            );
            $io->success('You have created '.$arg1.' users !');
        }
        else {
            $io->success('You have created 50 users !');
        }
        print($response->getContent());


        return Command::SUCCESS;
    }
}
