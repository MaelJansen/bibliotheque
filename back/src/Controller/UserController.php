<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\BookRepository;
use App\Repository\UserBookRepository;
use App\Repository\UserRepository;
use FOS\RestBundle\Controller\Annotations\View;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/api/user')]
class UserController extends AbstractController
{
    #[Route('/populars', methods: ['GET'])]
    public function getPopularsUsers(UserRepository $userRepository)
    {
        // Check if nb_users is valid
        if (isset($_GET['nb_users'])) {
            if ($_GET['nb_users'] < 0 || !is_numeric($_GET['nb_users'])) {
                return $this->json(['message' => 'Invalid number of users'], 400);
            } else {
                $nbUsers = $_GET['nb_users'];
            }
        } else {
            $nbUsers = 4;
        }
        $allUsers = $userRepository->getAllUsers();
        $users = [];
        foreach ($allUsers as $user) {
            $followedUsers = $user->getUSRFollowedUsers();
            foreach ($followedUsers as $followedUser) {
                array_push($users, $followedUser->getId());
            }
        }
        $users = array_count_values($users);
        arsort($users);
        $users = array_slice($users, 0, $nbUsers, true);
        $sortedUser = [];
        foreach ($users as $key => $value) {
            array_push($sortedUser, $userRepository->getOneUser($key));
        }
        return $this->json($sortedUser, 200, [], ['groups' => 'user_infos']);
    }


    #[View(serializerGroups: ['user_infos', 'last_books'])]
    #[Route('/{id}', methods: ['GET'])]
    public function getOneUser(UserRepository $userRepository, UserBookRepository $userBookRepository, int $id)
    {
        $newUser = $userRepository->getOneUser($id);
        if (!$newUser) {
            return $this->json(['message' => 'User not found'], 400);
        }
        // Créer un tableau associatif contenant les données de $newUser et $books
        $responseData = [
            'user' => $newUser,
        ];

        // Retourner le tableau associatif dans la réponse JSON
        return $this->json($responseData, 200, [], ['groups' => 'last_books']);
    }

    #[View(serializerGroups: ['user_infos'])]
    #[Route('/{id}/books', methods: ['GET'])]
    public function getOneUserBorrowedBooks(int $id, UserBookRepository $userBookRepository)
    {
        // Check if nb_books is valid
        if (isset($_GET['nb_books'])) {
            if ($_GET['nb_books'] < 0 || !is_numeric($_GET['nb_books'])) {
                return $this->json(['message' => 'Invalid number of books'], 400);
            } else {
                $nbBooks = $_GET['nb_books'];
            }
        } else {
            $nbBooks = 4;
        }
        $page = 1;
        // Check if page is valid
        if (isset($_GET['page'])) {
            if (is_numeric($_GET['page']) && $_GET['page'] > 0) {
                $page = $_GET['page'];
            } else {
                return $this->json(['message' => 'Invalid page value'], 400);
            }
        }
        $books = $userBookRepository->getBorrowedBook($id, $nbBooks, $page);
        return $this->json($books, 200, [], ['groups' => 'last_books']);
    }

    // Get all friends from one user
    #[Route('/{id}/friends', methods: ['GET'])]
    public function getUserFriends(int $id, UserRepository $userRepository)
    {
        // Check if nb_books is valid
        if (isset($_GET['nb_users'])) {
            if ($_GET['nb_users'] < 0 || !is_numeric($_GET['nb_users'])) {
                throw new HttpException(400, "Wrong number of users");
            } else {
                $nbUsers = $_GET['nb_users'];
            }
        } else {
            $nbUsers = 4;
        }
        $page = 1;
        // Check if page is valid
        if (isset($_GET['page'])) {
            if (is_numeric($_GET['page']) && $_GET['page'] > 0) {
                $page = $_GET['page'];
            } else {
                throw new HttpException(400, "Wrong page value");
            }
        }
        // Get the user with the specified id
        $user = $userRepository->getOneUser($id);
        if (!$user) {
            return $this->json(['message' => 'User not found'], 400);
        }
        // Get the friends of the user
        $friends = $user->getUSRFollowedUsers()->toArray();
        $res = array_slice($friends, ($page - 1) * $nbUsers, $nbUsers);
        return $this->json($res, 200, [], ['groups' => 'user_infos']);
    }

    #[Route('/{id}/recommendedusers', methods: ['GET'])]
    public function getUsersRecommendations(int $id, UserRepository $userRepository)
    {
        // Get the user with the specified id
        $user = $userRepository->getOneUser($id);
        if (!$user) {
            return $this->json(['message' => 'User not found'], 400);
        }
        // Check if nb_users is valid
        if (isset($_GET['nb_users'])) {
            if ($_GET['nb_users'] < 0 || !is_numeric($_GET['nb_users'])) {
                return $this->json(['message' => 'Invalid number of users'], 400);
            } else {
                $nbUsers = $_GET['nb_users'];
            }
        } else {
            $nbUsers = 4;
        }
        // Get the friends of the user
        $friends = $user->getUSRFollowedUsers()->toArray();
        if (empty($friends)) {
            return $this->getPopularsUsers($userRepository);
        }
        $users = [];
        // Get the friends of the friends
        foreach ($friends as $friend) {
            $friendsFriends = $friend->getUSRFollowedUsers()->toArray();
            // Adding the friends friends to the users array
            foreach ($friendsFriends as $user) {
                array_push($users, $user->getId());
            }
        }
        // Count the number of times a user is in the array
        $users = array_count_values($users);
        // Sort the users by the number of times they are in the array
        uasort($users, function ($a, $b) {
            if ($a == $b) {
                return 0;
            }
            return ($a > $b) ? -1 : 1;
        });
        $sortedUsers = [];
        foreach ($users as $key => $value) {
            array_push($sortedUsers, $userRepository->getOneUser($key));
        }
        $sortedUsers = array_slice($sortedUsers, 0, $nbUsers);

        return $this->json($sortedUsers, 200, [], ['groups' => 'user_infos']);
    }

    #[Route('/{id}/recommendedbooks', methods: ['GET'])]
    public function getUserBookRecommendations(
        int $id,
        BookRepository $bookRepository,
        BookController $bookController,
        UserRepository $userRepository
    ) {
        // Get the user with the specified id
        $user = $userRepository->getOneUser($id);
        if (!$user) {
            return $this->json(['message' => 'User not found'], 400);
        }
        // Check if nb_books is valid
        if (isset($_GET['nb_books'])) {
            if ($_GET['nb_books'] < 0 || !is_numeric($_GET['nb_books'])) {
                throw new HttpException(400, "Wrong number of books");
            } else {
                $nbBooks = $_GET['nb_books'];
            }
        } else {
            $nbBooks = 4;
        }
        // Get the friends of the user
        $friends = $user->getUSRFollowedUsers()->toArray();

        if (empty($friends)) {
            $bookController->getPopularBooks($bookRepository);
        }

        $books = [];
        // Get the books of the friends
        foreach ($friends as $friend) {
            $friendsBooks = $friend->getUSRBorrowedBooks()->toArray();
            // Adding the friends books to the books array
            foreach ($friendsBooks as $book) {
                array_push($books, $book->getUSBBook()->getId());
            }
        }
        // Count the number of times a book is in the array
        $books = array_count_values($books);
        // Sort the books by the number of times they are in the array
        uasort($books, function ($a, $b) {
            if ($a == $b) {
                return 0;
            }
            return ($a > $b) ? -1 : 1;
        });
        $sortedBooks = [];
        foreach ($books as $key => $value) {
            array_push($sortedBooks, $bookRepository->getOneBook($key)[0]);
        }
        $sortedBooks = array_slice($sortedBooks, 0, $nbBooks);

        return $this->json($sortedBooks, 200, [], ['groups' => 'last_books']);
    }
}
