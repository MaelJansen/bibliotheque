<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View;
use Symfony\Component\HttpKernel\Exception\HttpException;

#[Route('/api/books')]
class BookController extends AbstractController
{
    #[View(serializerGroups: ['preview'])]
    #[Route('/', name: 'app_book', methods:['GET'])]
    public function index(BookRepository $repository)
    {   
        if (!isset($_GET['q']) || !isset($_GET['page']) || !isset($_GET['result'])) {
            throw new HttpException(400, "Missing query parameter");
        }
        $query = $_GET['q']?$_GET['q']:"";
        $page = $_GET['page']?$_GET['page']:1;
        $NbResult = $_GET['result']?$_GET['result']:10;

        $res = array_slice($repository->findByAuthor($query), $page-1, $NbResult);
        return $res;
    }

    #[View(serializerGroups: ['preview'])]
    #[Route('/latest', name: 'endpoint_latestBook')]
    public function getFourLastBook(BookRepository $repository)
    {
        $result = $repository->getLastBook();
        return $result;
    }

    #[View(serializerGroups: ['book_infos'])]
    #[Route('/{id}', name: 'endpointId', methods: ['GET'])]
    public function getOneBook(BookRepository $repository, int $id)
    {
        $result = $repository->getOneBook($id);
        return $result;
    }
}
