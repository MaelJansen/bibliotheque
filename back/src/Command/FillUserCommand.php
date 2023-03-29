<?php

namespace App\Command;

use App\Entity\Grade;
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
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasher;
use Symfony\Component\PasswordHasher\Hasher\UserPasswordHasherInterface;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Contracts\HttpClient\HttpClientInterface;

#[AsCommand(
    name: 'app:fill-user',
    description: 'Add a short description for your command',
)]
/**
 * Summary of FillUserCommand
 */
class FillUserCommand extends Command
{
    // Adding the different repositories
    private $client;
    private $entityManager;
    private $bookRepository;
    private $userRepository;
    private $passwordHasher;
    private $passwordAuthenticatedUserInterface;

    /**
     * Summary of __construct
     * @param HttpClientInterface $client
     * @param EntityManagerInterface $entityManager
     */
    public function __construct(
        HttpClientInterface $client,
        EntityManagerInterface $entityManager,
        UserRepository $userRepository,
        BookRepository $bookRepository,
        UserPasswordHasherInterface $passwordHasher,
        PasswordAuthenticatedUserInterface $passwordAuthenticatedUserInterface
    ) {
        // Setting the different repositories
        $this->bookRepository = $bookRepository;
        $this->entityManager = $entityManager;
        $this->userRepository = $userRepository;
        $this->passwordHasher = $passwordHasher;
        $this->passwordAuthenticatedUserInterface = $passwordAuthenticatedUserInterface;
        $this->client = $client;
        parent::__construct();
    }
    protected function configure(): void
    {
        $this
            ->setDescription("This function is used to fill the database with user from the api randomuser.me")
            ->addArgument('nbUser', InputArgument::OPTIONAL, 'Number of user you want to create');
    }

    protected function execute(InputInterface $input, OutputInterface $output): int
    {
        $io = new SymfonyStyle($input, $output);
        // Getting the argument
        $arg1 = $input->getArgument('nbUser');
        // Getting the response from the api randomuser.me
        $response = $this->client->request(
            'GET',
            'https://randomuser.me/api/',
            [
                'query' => [
                    'nat' => 'fr',
                    'results' => 50,
                    'inc' => 'name,email,picture,login',
                ],
            ]
        );
        // If the argument is set we use it to create the number of user we want
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
        }
        // We get all the books from the database
        $books = $this->bookRepository->findAll();

        // We create the user and we add the userbook and the grade
        foreach ($response->toArray()["results"] as $user) {
            print($user['name']['first']);
            //Creating the user
            $createdUser = new User();
            $createdUser->__construct();
            // Add to the user a random number of book between 0 and 10
            for ($i = 0; $i < rand(0, 10); $i++) {
                $createdUserBook = new UserBook();
                $createdUserBook->setUSBBook($books[array_rand($books)]);
                $createdUserBook->setUSBDateBorrowed(new \DateTime());
                // We add a given back date to 1/2 of the userbook
                if ($i % 2 == 0) {
                    $createdUserBook->setUSBDateGivenBack(new \DateTime(datetime : 'now + 1 week'));
                }
                // We add a grade to 1/3 of the userbook
                if ($i % 3 == 0) {
                    $createdGrade = new Grade();
                    $createdGrade->setGRABook($createdUserBook->getUSBBook());
                    $createdGrade->setGRAUser($createdUser);
                    // We add a random grade between 0 and 5
                    $createdGrade->setGRARate(rand(0, 5));
                    $this->entityManager->persist($createdGrade);
                }
                $createdUserBook->setUSBUser($createdUser);
                $this->entityManager->persist($createdUserBook);
                $createdUser->addUSRBorrowedBook($createdUserBook);
            }
            // We get all the users from the database
            $users = $this->userRepository->findAll();
            // We add a random number of follower between 0 and 5
            $nbFollows = rand(0, 5);
            for ($i = 0; $i < $nbFollows; $i++) {
                // We check if there is a user in the database
                if (count($users) > 0) {
                    $createdUser->addUSRFollowedUser($users[array_rand($users)]);
                }
            }
            // We add the information of the user from the api
            $createdUser->setUSRName($user['name']['last']);
            $createdUser->setUSRFirstName($user['name']['first']);
            $createdUser->setUSREmail($user['email']);
            $createdUser->setUSRPassword(
                $this->passwordHasher->hashPassword($createdUser, $user['login']['password'])
            );
            $createdUser->setUSRProfilePicture($user['picture']['large']);
            // We persist the user
            $this->entityManager->persist($createdUser);
            // We flush all the changes
            $this->entityManager->flush();
        }

        $io->success('You have created 50 users !');

        return Command::SUCCESS;
    }
}
