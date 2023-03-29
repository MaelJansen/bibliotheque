<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Symfony\Component\HttpFoundation\Response;
use OpenApi\Attributes as OA;

#[OA\Tag("Author")]
#[Route('/api/authors')]
class AuthorController extends AbstractController
{
    #[OA\Get(
        summary: "Donne des auteurs commençant par une partie du nom donné"
    )]
    #[OA\Response(
        response: 200,
        description: "Des auteurs commençant par une partie du nom donné",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/AuthorInfos"
            )
        )
    )]
    #[OA\Parameter(
        name: "q",
        in: "query",
        description: "Une partie du nom de l'auteur",
        required: true,
        schema: new OA\Schema(type: "string")
    )]
    #[View(serializerGroups: ['author_infos'])]
    #[Route('/', name: 'app_author', methods:['GET'])]
    public function index(AuthorRepository $repository)
    {
        if (isset($_GET['q'])) {
            return $repository->getAuthorByName($_GET['q']);
        } else {
            throw new HttpException(400, "Missing query string");
        }
    }
}
