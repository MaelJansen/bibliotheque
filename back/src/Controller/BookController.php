<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use App\Repository\GradeRepository;
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
        $nbResult = 10;
        $query = "";
        if (!isset($_GET['q'])) {
            $res = array_slice($repository->findByAuthor($query), ($page - 1) * $nbResult, $nbResult);
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
                    $nbResult = $_GET['result'];
                } else {
                    throw new HttpException(400, "Wrong parameter");
                }
            }
            $res = array_slice($repository->findByAuthor($query), ($page - 1) * $nbResult, $nbResult);
        }
        return ["nbResult" => count($repository->findByAuthor($query)) , "datas" => $res];
    }

    #[View(serializerGroups: ['preview'])]
    #[Route('/popular', name: 'endpoint_popularBook', methods: ['GET'])]
    public function getPopularBooks(BookRepository $repository)
    {
        if (isset($_GET['result'])) {
            if (is_numeric($_GET['result']) && $_GET['result'] > 0) {
                $nbResult = $_GET['result'];
            } else {
                throw new HttpException(400, "Wrong parameter");
            }
        } else {
            $nbResult = 4;
        }
        return $repository->getPopularBooks($nbResult);
    }

    // Get the four last books added to the database
    #[View(serializerGroups: ['preview'])]
    #[Route('/latest', name: 'endpoint_latestBook')]
    public function getFourLastBook(BookRepository $repository)
    {
        return $repository->getLastBook();
    }

    #[View(serializerGroups: ['book_infos','book_grade'])]
    #[Route('/{id}', name: 'endpointId', methods: ['GET'])]
    public function getOneBook(BookRepository $bookRepository, GradeRepository $gradeRepository, int $id)
    {
        $grades = $gradeRepository->getBookGrades($id);
        $averageGrade = null;
        if (!empty($grades)) {
            $averageGrade = 0;
            foreach ($grades as $grade) {
                $averageGrade += $grade->getGRARate();
            }
            $averageGrade = $averageGrade / count($grades);
        }
        return ["averageGrade" => round($averageGrade), "book" => $bookRepository->getOneBook($id)];
    }
}
