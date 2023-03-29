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

#[Route('/api/user')]
#[OA\Tag("User")]
class UserController extends AbstractController
{
    #[OA\Get(
        summary: "Donne un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "1 utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserLastBooks"
            )
        )
    )]
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

    #[OA\Get(
        summary: "Donne les livres d'un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les livres de l'utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/LastBooksInfos"
            )
        )
    )]
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
    #[OA\Get(
        summary: "Donne les amis d'un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les amis de l'utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserInfos"
            )
        )
    )]
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

    #[OA\Get(
        summary: "Donne un certain nombre (4 par défaut) de livres recommandés à un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "les livres recommandés à l'utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserInfos"
            )
        )
    )]
    #[OA\Parameter(
        name: "nb_books",
        in: "query",
        description: "le nombre de livres à afficher",
        required: false,
        schema: new OA\Schema(type: "int", minimum: 1, default: 4)
    )]
    #[Route('/{id}/recommendedbooks', methods: ['GET'])]
    public function getUserBookRecommendations(int $id, BookRepository $bookRepository, UserRepository $userRepository)
    {
        // Get the user with the specified id
        $user = $userRepository->getOneUser($id);
        if (!$user) {
            return $this->json(['message' => 'User not found'], 400);
        }
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
        // Get the friends of the user
        $friends = $user->getUSRFollowedUsers()->toArray();
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
