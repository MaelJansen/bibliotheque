<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View;

#[Route('/api/books')]
class BookController extends AbstractController
{
    #[Route('/', name: 'app_book')]
    public function index(): JsonResponse
    {
        return $this->json([
            'message' => 'Welcome to your new controller!',
            'path' => 'src/Controller/BookController.php',
        ]);
    }

    #[View(serializerGroups: ['preview'])]
    #[Route('/latest')]
    public function getFourLastBook(BookRepository $repository)
    {
        $result = $repository->getLastBook();
        return json_encode($result);
    }
}