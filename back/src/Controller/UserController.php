<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserBookRepository;
use App\Repository\UserRepository;
use FOS\RestBundle\Controller\Annotations\View;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/user')]
class UserController extends AbstractController
{
    #[View(serializerGroups: ['user_infos', 'last_books'])]
    #[Route('/{id}', methods: ['GET'], requirements: ['_format' => 'json'])]
    public function getOneUser(UserRepository $userRepository, UserBookRepository $userBookRepository, int $id)
    {
        $newUser = $userRepository->getOneUser($id);
        if (!$newUser) {
            return $this->json(['message' => 'User not found'], 400);
        }
        $books = $userBookRepository->getBorrowedBook($newUser->getId());

        // Créer un tableau associatif contenant les données de $newUser et $books
        $responseData = [
            'user' => $newUser,
            'books' => $books,
        ];

        // Retourner le tableau associatif dans la réponse JSON
        return $this->json($responseData, 200, [], ['groups' => 'last_books']);
    }
}
