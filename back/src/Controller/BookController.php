<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use App\Repository\GradeRepository;
use FOS\RestBundle\Controller\Annotations\View;
use OpenApi\Attributes as OA;
use Symfony\Component\HttpKernel\Exception\HttpException;

#[Route('/api/books')]
#[OA\Tag("Books")]
class BookController extends AbstractController
{
    #[OA\Get(
        summary: "Donne les 10 livres affichés sur la page d'accueil"
    )]
    #[OA\Response(
        response: 200,
        description: "10 livres pour la page d'accueil",
        content: new OA\JsonContent(
            ref: "#/components/schemas/Books"
        )
    )]
    #[OA\Parameter(
        name: "q",
        in: "query",
        description: "une partie du nom de l'auteur",
        required: false,
        schema: new OA\Schema(type: "string")
    )]
    #[OA\Parameter(
        name: "page",
        in: "query",
        description: "le numéro de la page",
        required: false,
        schema: new OA\Schema(type: "int", minimum: 1, default: 1)
    )]
    #[OA\Parameter(
        name: "result",
        in: "query",
        description: "le nombre de résultat à afficher",
        required: false,
        schema: new OA\Schema(type: "int", minimum: 1, default: 10)
    )]
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

    #[OA\Get(
        summary: "Donne un certain nombre (4 par défaut) de livre populaires",
    )]
    #[OA\Response(
        response: 200,
        description: "Les livres populaires",
        content: new OA\JsonContent(
            ref: "#/components/schemas/PopularBooks"
        )
    )]
    #[OA\Parameter(
        name: "result",
        in: "query",
        description: "le nombre de résultat à afficher",
        required: false,
        schema: new OA\Schema(type: "int", minimum: 1, default: 4)
    )]
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
    #[OA\Get(
        summary: "Donne les 4 derniers livres",
    )]
    #[OA\Response(
        response: 200,
        description: "Les 4 derniers livres",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/BookPreview"
            )
        )
    )]
    #[View(serializerGroups: ['preview'])]
    #[Route('/latest', name: 'endpoint_latestBook', methods:['GET'])]
    public function getFourLastBook(BookRepository $repository)
    {
        return $repository->getLastBook();
    }

    #[OA\Get(
        summary: "Donne un livre en particulier",
    )]
    #[OA\Response(
        response: 200,
        description: "Un livre",
        content: new OA\JsonContent(
            ref: "#/components/schemas/SingleBook"
        )
    )]
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
