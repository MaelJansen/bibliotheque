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
use Nelmio\ApiDocBundle\Annotation\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Exception;

#[Route('/api/user')]
class UserController extends AbstractController
{
    #[Route('/populars', methods: ['GET'])]
    public function getPopularsUsers(UserRepository $userRepository, int $id = null)
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
                if ($id != null) {
                    if ($followedUser->getId() != $id) {
                        array_push($users, $followedUser->getId());
                    }
                } else {
                    array_push($users, $followedUser->getId());
                }
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
    public function getOneUser(UserRepository $userRepository, int $id)
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
        $nbResult = count($friends);
        $res = array_slice($friends, ($page - 1) * $nbUsers, $nbUsers);
        $returnPackage = ["nbResult" => $nbResult, "data" => $res];
        return $this->json($returnPackage, 200, [], ['groups' => 'user_infos']);
    }

    #[Route('/{id}/recommendedusers', methods: ['GET'])]
    public function getUsersRecommendations(int $id, UserRepository $userRepository)
    {
        // Get the user with the specified id
        $thisUser = $userRepository->getOneUser($id);
        if (!$thisUser) {
            throw new HttpException(400, "User not found");
        }
        // Check if nb_users is valid
        if (isset($_GET['nb_users'])) {
            if ($_GET['nb_users'] < 0 || !is_numeric($_GET['nb_users'])) {
                throw new HttpException(400, "Wrong number of users");
            } else {
                $nbUsers = $_GET['nb_users'];
            }
        } else {
            $nbUsers = 4;
        }
        // Get the friends of the user
        $friends = $thisUser->getUSRFollowedUsers()->toArray();
        $populars = $this->getPopularsUsers($userRepository, $id);
        // If the user has no friends, return the most popular users
        if (empty($friends)) {
            return $this->json($populars, 200, [], ['groups' => 'user_infos']);
        }
        $recommandedUsers = [];
        // Get all the users
        $allUsers = $userRepository->getAllUsers();
        foreach ($allUsers as $user) {
            $followedUsers = $user->getUSRFollowedUsers();
            foreach ($followedUsers as $followedUser) {
                if ($id != null) {
                    if ($followedUser->getId() != $id) {
                        array_push($recommandedUsers, $followedUser->getId());
                    }
                } else {
                    array_push($recommandedUsers, $followedUser->getId());
                }
            }
        }
        // Get the friends of the friends
        foreach ($friends as $friend) {
            $friendsFriends = $friend->getUSRFollowedUsers()->toArray();
            // Adding the friends friends to the users array
            for ($i = 0; $i < 3; $i++) {
                foreach ($friendsFriends as $user) {
                    if ($user->getId() != $thisUser->getId()) {
                        array_push($recommandedUsers, $user->getId());
                    }
                }
            }
        }
        // Count the number of times a user is in the array
        $recommandedUsers = array_count_values($recommandedUsers);
        // Sort the users by the number of times they are in the array
        arsort($recommandedUsers);
        $sortedUsers = [];
        foreach ($recommandedUsers as $key => $value) {
            if ($key != $thisUser->getId()) {
                array_push($sortedUsers, $userRepository->getOneUser($key));
            }
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
        $ourBorrowedBooks = $user->getUSRBorrowedBooks()->toArray();
        // Get the books of the friends
        foreach ($friends as $friend) {
            $friendsBooks = $friend->getUSRBorrowedBooks()->toArray();
            // Adding the friends books to the books array
            foreach ($friendsBooks as $book) {
                if (!in_array($book, $ourBorrowedBooks)) {
                    array_push($books, $book->getUSBBook()->getId());
                }
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

    #[IsGranted("ROLE_USER")]
    #[Security(name: "Bearer")]
    #[Route('/{id}/friends', methods: ['POST'])]
    public function addFriends(
        int $id,
        UserRepository $repository,
        Request $request,
        EntityManagerInterface $entityManager
    ) {
        $friendId = $request->query->get('friendId');
        if (is_numeric($friendId)) {
            $user = $repository->getOneUser($id);
            $userFollowed = $repository->getOneUser($friendId);
            if ($userFollowed != null) {
                foreach ($user->getUSRFollowingUsers() as $fu) {
                    if ($fu->getId() === $userFollowed->getID()) {
                        throw new HttpException(400, 'You are already following this user');
                    }
                }
                $user->addUSRFollowingUser($userFollowed);
                $userFollowed->addUSRFollowedUser($user);
                $entityManager->persist($user);
                $entityManager->persist($userFollowed);
                $entityManager->flush();
            } else {
                throw new HttpException(400, 'The followed user doesn\'t exist');
            }
        } else {
            throw new HttpException(500, 'No numeric argument');
        }
        return $this->json([
            'userId' => $user->getId(),
            'followedUserID' => $userFollowed->getId()
        ]);
    }

    #[IsGranted("ROLE_USER")]
    #[Security(name: "Bearer")]
    #[Route('/{id}/friends', methods: ['DELETE'])]
    public function removeFriends(
        int $id,
        UserRepository $repository,
        Request $request,
        EntityManagerInterface $entityManager
    ) {
        $followed = false;
        $friendId = $request->query->get('friendId');
        var_dump($friendId);
        if (is_numeric($friendId)) {
            $user = $repository->getOneUser($id);
            $userFollowed = $repository->getOneUser($friendId);
            if ($userFollowed != null) {
                foreach ($user->getUSRFollowingUsers() as $fu) {
                    if ($fu->getId() === $userFollowed->getID()) {
                        $followed = true;
                    }
                }
                if ($followed == false) {
                    throw new HttpException(400, 'You aren\'t following this user');
                }
                $user->removeUSRFollowingUser($userFollowed);
                $userFollowed->removeUSRFollowedUser($user);
                $entityManager->persist($user);
                $entityManager->persist($userFollowed);
                $entityManager->flush();
            } else {
                throw new HttpException(400, 'The followed user doesn\'t exist');
            }
        } else {
            throw new HttpException(500, 'No numeric argument');
        }
        return $this->json([
            'userId' => $user->getId(),
            'followedUserID' => $userFollowed->getId()
        ]);
    }
}
