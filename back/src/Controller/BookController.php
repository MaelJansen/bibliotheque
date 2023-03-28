<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\BookRepository;
use FOS\RestBundle\Controller\Annotations\View;
use OpenApi\Attributes as OA;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Serializer\SerializerInterface;

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
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/BookPreview"
            )
        )
    )]
    #[View(serializerGroups: ['preview'])]
    #[Route('/', name: 'app_book', methods:['GET'])]
    public function index(BookRepository $repository)
    {
        if (isset($_GET['q'])) {
            $result = $repository->findByAuthor($_GET['q']);
        } else {
            $result = $repository->getTenBook();
        }
        return $result;
    }

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
    #[Route('/latest', methods:['GET'])]
    public function getFourLastBook(BookRepository $repository)
    {
        $result = $repository->getLastBook();
        return $result;
    }

    #[OA\Get(
        summary: "Donne un livre en particulier",
    )]
    #[OA\Response(
        response: 200,
        description: "Un livre",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/BookInfos"
            )
        )
    )]
    #[View(serializerGroups: ['book_infos'])]
    #[Route('/{id}', methods: ['GET'])]
    public function getOneBook(BookRepository $repository, int $id)
    {
        $result = $repository->getOneBook($id);
        return $result;
    }
}
