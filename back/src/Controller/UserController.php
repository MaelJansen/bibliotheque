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
use OpenApi\Attributes as OA;
use Nelmio\ApiDocBundle\Annotation\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;
use Symfony\Component\HttpFoundation\Request;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Component\HttpFoundation\RedirectResponse;

#[Route('/api/user')]
#[OA\Tag("User")]
class UserController extends AbstractController
{
    #[OA\Get(
        summary: "Donne des utilisateurs populaires"
    )]
    #[OA\Response(
        response: 200,
        description: "Des utilisateurs populaires",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserInfos"
            )
        )
    )]
    #[OA\Parameter(
        name: "result",
        description: "Le nombre d'utilisateurs voulu",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[Route('/populars', name:'popular', methods: ['GET'])]
    public function getPopularsUsers(UserRepository $userRepository, int $id = null)
    {
        // Check if result is valid
        if (isset($_GET['result'])) {
            if ($_GET['result'] < 0 || !is_numeric($_GET['result'])) {
                throw new HttpException(400, "Invalid number of users");
            } else {
                $nbUsers = $_GET['result'];
            }
        } else {
            $nbUsers = 4;
        }
        // Get all users
        $allUsers = $userRepository->getAllUsers();
        $users = [];
        // Get all followed users of each user
        foreach ($allUsers as $user) {
            $followedUsers = $user->getUSRFollowedUsers();
            // For each followed user, add it to the array
            foreach ($followedUsers as $followedUser) {
                // We don't want to count the user himself
                if ($id != null) {
                    if ($followedUser->getId() != $id) {
                        array_push($users, $followedUser->getId());
                    }
                } else {
                    array_push($users, $followedUser->getId());
                }
            }
        }
        // Sort the array by number of occurences
        $users = array_count_values($users);
        arsort($users);
        // Get the first $nbUsers users
        $users = array_slice($users, 0, $nbUsers, true);
        $sortedUser = [];
        // Get the user object from the id
        foreach ($users as $key => $value) {
            array_push($sortedUser, $userRepository->getOneUser($key));
        }
        return $this->json($sortedUser, 200, [], ['groups' => 'user_infos']);
    }

    #[OA\Get(
        summary: "Donne un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "1 utilisateur",
        content: new OA\JsonContent(
            ref: "#/components/schemas/SingleUser"
        )
    )]
    #[View(serializerGroups: ['user_infos', 'last_books'])]
    #[Route('/{id}', methods: ['GET'])]
    public function getOneUser(UserRepository $userRepository, int $id)
    {
        $user = $userRepository->getOneUser($id);
        if (!$user) {
            throw new HttpException(404, "User not found or this user doesn't exist");
        }
        // Retourner le tableau associatif dans la réponse JSON
        return $this->json($user, 200, [], ['groups' => 'last_books']);
    }

    #[OA\Get(
        summary: "Donne les livres d'un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les livres de l'utilisateur",
        content: new OA\JsonContent(
            ref: "#/components/schemas/UserBooks"
        )
    )]
    #[OA\Parameter(
        name: "result",
        description: "le nombre de livres voulu",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[OA\Parameter(
        name: "page",
        description: "le numero de la page (de la liste)",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[View(serializerGroups: ['user_infos'])]
    #[Route('/{id}/books', methods: ['GET'])]
    public function getOneUserBorrowedBooks(int $id, UserBookRepository $userBookRepository)
    {
        // Check if result is valid
        if (isset($_GET['result'])) {
            if ($_GET['result'] < 0 || !is_numeric($_GET['result'])) {
                throw new HttpException(400, "Invalid number of books");
            } else {
                $nbBooks = $_GET['result'];
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
                throw new HttpException(400, "Invalid page number");
            }
        }
        $books = $userBookRepository->getBorrowedBook($id, $nbBooks, $page);
        // Retourner le tableau associatif dans la réponse JSON
        $res = [
            'books' => $books,
            'nbResult' => $userBookRepository->getTheNumberOfBorrowedBooks($id)
        ];
        return $this->json($res, 200, [], ['groups' => 'last_books']);
    }

    // Get all friends from one user
    #[OA\Get(
        summary: "Donne les amis d'un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les amis de l'utilisateur",
        content: new OA\JsonContent(
            ref: "#/components/schemas/UserFriends"
        )
    )]
    #[OA\Parameter(
        name: "result",
        description: "le nombre d'utilisateurs",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[OA\Parameter(
        name: "page",
        description: "le numero de la page (de la liste)",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[Route('/{id}/friends', methods: ['GET'])]
    public function getUserFriends(int $id, UserRepository $userRepository)
    {
        // Check if result is valid
        if (isset($_GET['result'])) {
            if ($_GET['result'] < 0 || !is_numeric($_GET['result'])) {
                throw new HttpException(400, "Wrong number of users");
            } else {
                $nbUsers = $_GET['result'];
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
            throw new HttpException(404, "User not found or this user doesn't exist");
        }
        // Get the friends of the user
        $friends = $user->getUSRFollowedUsers()->toArray();
        // Get the number of friends
        $nbResult = count($friends);
        // Get the number of friends asked
        $res = array_slice($friends, ($page - 1) * $nbUsers, $nbUsers);
        $returnPackage = ["nbResult" => $nbResult, "data" => $res];
        return $this->json($returnPackage, 200, [], ['groups' => 'user_infos']);
    }

    #[OA\Get(
        summary: "Donne une liste d'utilisateurs recommandés (comme amis)"
    )]
    #[OA\Response(
        response: 200,
        description: "Une liste d'utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserInfos"
            )
        )
    )]
    #[OA\Parameter(
        name: "result",
        description: "le nombre d'utilisateurs",
        in: "query",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[Route('/{id}/recommendedusers', methods: ['GET'])]
    public function getUsersRecommendations(int $id, UserRepository $userRepository)
    {
        // Get the user with the specified id
        $thisUser = $userRepository->getOneUser($id);
        if (!$thisUser) {
            throw new HttpException(400, "User not found");
        }
        // Check if result is valid
        if (isset($_GET['result'])) {
            if ($_GET['result'] < 0 || !is_numeric($_GET['result'])) {
                throw new HttpException(400, "Wrong number of users");
            } else {
                $nbUsers = $_GET['result'];
            }
        } else {
            $nbUsers = 4;
        }
        // Get the friends of the user
        $friends = $thisUser->getUSRFollowedUsers()->toArray();
        // If the user has no friends, return the most popular users
        if (empty($friends)) {
            return $this->redirectToRoute('popular');
        }
        $recommandedUsers = [];
        // Get all the users
        $allUsers = $userRepository->getAllUsers();
        foreach ($allUsers as $user) {
            $followedUsers = $user->getUSRFollowedUsers();
            foreach ($followedUsers as $followedUser) {
                if (!in_array($followedUser, $friends)) {
                    if ($id != null) {
                        if ($followedUser->getId() != $id) {
                            array_push($recommandedUsers, $followedUser->getId());
                        }
                    } else {
                        array_push($recommandedUsers, $followedUser->getId());
                    }
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

    #[OA\Get(
        summary: "Donne un certain nombre (4 par défaut) de livres recommandés à un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les livres recommandés à l'utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/LastBooksInfos"
            )
        )
    )]
    #[OA\Parameter(
        name: "result",
        in: "query",
        description: "le nombre de livres à afficher",
        required: false,
        schema: new OA\Schema(type: "int", minimum: 1, default: 4)
    )]
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
        // Check if result is valid
        if (isset($_GET['result'])) {
            if ($_GET['result'] < 0 || !is_numeric($_GET['result'])) {
                throw new HttpException(400, "Wrong number of books");
            } else {
                $nbBooks = $_GET['result'];
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

    #[OA\Post(
        summary: "Ajoute un ami"
    )]
    #[OA\Response(
        response: 200,
        description: "Ajoute un ami",
        content: new OA\JsonContent(
            ref: "#/components/schemas/AddOrRemoveFriend"
        )
    )]
    #[OA\Parameter(
        name: "friendId",
        description: "l'Id de l'utilisateur à ajouter en ami",
        in: "query",
        required: true,
        schema: new OA\Schema(type: "string")
    )]
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
            $userFollowing = $repository->getOneUser($friendId);
            if ($userFollowing != null) {
                foreach ($user->getUSRFollowedUsers() as $fu) {
                    if ($fu->getId() === $userFollowing->getID()) {
                        throw new HttpException(400, 'You are already following this user');
                    }
                }
                $user->addUSRFollowedUser($userFollowing);
                $userFollowing->addUSRFollowingUser($user);
                $entityManager->persist($user);
                $entityManager->persist($userFollowing);
                $entityManager->flush();
            } else {
                throw new HttpException(400, 'The followed user doesn\'t exist');
            }
        } else {
            throw new HttpException(500, 'No numeric argument');
        }
        return $this->json([
            'userId' => $user->getId(),
            'followedUserID' => $userFollowing->getId()
        ]);
    }

    #[OA\Delete(
        summary: "Ne plus suivre un ami"
    )]
    #[OA\Response(
        response: 200,
        description: "L'ami qui n'es plus suivi",
        content: new OA\JsonContent(
            ref: "#/components/schemas/AddOrRemoveFriend"
        )
    )]
    #[OA\Parameter(
        name: "friendId",
        description: "l'Id de l'utilisateur à ajouter en ami",
        in: "query",
        required: true,
        schema: new OA\Schema(type: "string")
    )]
    #[IsGranted("ROLE_USER")]
    #[Security(name: "Bearer")]
    #[Route('/{id}/friends', methods: ['DELETE'])]
    public function removeFriends(
        int $id,
        UserRepository $repository,
        Request $request,
        EntityManagerInterface $entityManager
    ) {
        $following = false;
        $friendId = $request->query->get('friendId');
        if (is_numeric($friendId)) {
            $user = $repository->getOneUser($id);
            $userFollowing = $repository->getOneUser($friendId);
            if ($userFollowing != null) {
                foreach ($user->getUSRFollowedUsers() as $fu) {
                    if ($fu->getId() === $userFollowing->getID()) {
                        $following = true;
                    }
                }
                if ($following == false) {
                    throw new HttpException(400, 'You aren\'t following this user');
                }
                $user->removeUSRFollowedUser($userFollowing);
                $userFollowing->removeUSRFollowingUser($user);
                $entityManager->persist($user);
                $entityManager->persist($userFollowing);
                $entityManager->flush();
            } else {
                throw new HttpException(400, 'The followed user doesn\'t exist');
            }
        } else {
            throw new HttpException(500, 'No numeric argument');
        }
        return $this->json([
            'userId' => $user->getId(),
            'followedUserID' => $userFollowing->getId()
        ]);
    }
}
