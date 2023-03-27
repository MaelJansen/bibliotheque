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
    public function index(BookRepository $repository)
    {
        $result = $repository->getTenBook();
        return $result;
    }

    #[View(serializerGroups: ['preview'])]
    #[Route('/latest')]
    public function getFourLastBook(BookRepository $repository)
    {
        $result = $repository->getLastBook();
        return $result;
    }
}