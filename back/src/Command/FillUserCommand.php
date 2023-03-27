<?php

namespace App\Command;

use App\Entity\User;
use App\Entity\UserBook;
use App\Repository\BookRepository;
use App\Repository\UserRepository;
use Doctrine\ORM\EntityManagerInterface;
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
    private $entityManager;

    private $bookRepository;
    private $userRepository;

    /**
     * Summary of __construct
     * @param HttpClientInterface $client
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(HttpClientInterface $client, EntityManagerInterface $entityManager, 
    UserRepository $userRepository, BookRepository $bookRepository)
    {
        $this->bookRepository = $bookRepository;
        $this->entityManager = $entityManager;
        $this->userRepository = $userRepository;
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
            $io->success('You have created ' . $arg1 . ' users !');
        }

        $books = $this->bookRepository->findAll();

        print($response->getContent());

        foreach ($response->toArray()["results"] as $user) {
            print($user['name']['first']);
            $createdUser = new User();
            $createdUser->__construct();
            for ($i=0; $i < rand(0, 10); $i++) {
                $createdUserBook = new UserBook();
                $createdUserBook->setUSBDateBorrowed(new \DateTime());
                if ($i % 2 == 0) {
                    $createdUserBook->setUSBDateGivenBack(new \DateTime(datetime : 'now + 1 week'));
                }
                if ($i % 3 == 0) {
                    $createdUserBook->setUSBGrade(rand(0, 1));
                }
                $createdUserBook->setUSBBook($books[array_rand($books)]);
                $createdUserBook->setUSBIdUser($createdUser->getId());
                $this->entityManager->persist($createdUserBook);
                $createdUser->addUSRBorrowedBook($createdUserBook);
            }
            $users = $this->userRepository->findAll();
            $nbFollowers = rand(0, 5);
            for ($i=0; $i < $nbFollowers; $i++) {
                $createdUser->addUSRFollowedUser($users[array_rand($users)]);
            }
            $createdUser->setUSRName($user['name']['last']);
            $createdUser->setUSRFirstName($user['name']['first']);
            $createdUser->setUSREmail($user['email']);
            $createdUser->setUSRPassword(
                password_hash($user['login']['password'], PASSWORD_BCRYPT));
            $createdUser->setUSRProfilePicture($user['picture']['large']);
            $this->entityManager->persist($createdUser);
            $this->entityManager->flush();
        }

        $io->success('You have created 50 users !');

        return Command::SUCCESS;
    }
}
