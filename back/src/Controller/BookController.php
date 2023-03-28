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
        $page = 1;
        $NbResult = 10;
        $query = "";
        if (!isset($_GET['q'])) {
            $res = array_slice($repository->findByAuthor($query), ($page - 1) * $NbResult, $NbResult);
        } else {
            $query = $_GET['q'] ? $_GET['q'] : "";
            if (isset($_GET['page'])) {
                if (is_numeric($_GET['page']) && $_GET['page'] > 0) {
                    $page = $_GET['page'];
                } else {
                    throw new HttpException(400, "Wrong parameter");
                }
            }
            if (isset($_GET['result'])) {
                if (is_numeric($_GET['result']) && $_GET['result'] > 0) {
                    $NbResult = $_GET['result'];
                } else {
                    throw new HttpException(400, "Wrong parameter");
                }
            }
            $res = array_slice($repository->findByAuthor($query), ($page - 1) * $NbResult, $NbResult);
        }
        return ["nbResult"=>count($repository->findByAuthor($query)) , "datas"=>$res];
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
