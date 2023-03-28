<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View;

#[Route('/api/books')]
class BookController extends AbstractController
{
    #[View(serializerGroups: ['preview'])]
    #[Route('/', name: 'app_book')]
    public function index(BookRepository $repository)
    {
        if (isset($_GET['q'])) {
            $result = $repository->findByAuthor($_GET['q']);
        } else {
            $result = $repository->getTenBook();
        }
        return $result;
    }

    #[View(serializerGroups: ['preview'])]
    #[Route('/latest')]
    public function getFourLastBook(BookRepository $repository)
    {
        $result = $repository->getLastBook();
        return $result;
    }

    #[View(serializerGroups: ['book_infos'])]
    #[Route('/{id}', methods: ['GET'])]
    public function getOneBook(BookRepository $repository, int $id)
    {
        $result = $repository->getOneBook($id);
        return $result;
    }
}
