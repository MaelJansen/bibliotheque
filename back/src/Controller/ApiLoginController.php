<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use OpenApi\Attributes as OA;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

#[Route('/api/login')]
#[OA\Tag("Login")]
class ApiLoginController extends AbstractController
{
    #[OA\Post(
        summary: "Connecte un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "Connecte un utilisateur",
        content: new OA\JsonContent(
            type: 'array',
            items: new OA\Items(
                ref: "#/components/schemas/UserNew"
            )
        )
    )]
    #[OA\Parameter(
        name: "email",
        description: "l'email de l'utilisateur",
        in: "query",
        required: true,
        schema: new OA\Schema(type: "string")
    )]
    #[OA\Parameter(
        name: "password",
        description: "le mot de passe (en clair) de l'utilisateur",
        in: "query",
        required: true,
        schema: new OA\Schema(type: "string")
    )]
    #[OA\RequestBody(
        content: new OA\JsonContent(ref: "#/components/schemas/UserNew")
    )]
    #[Route('/', name: 'app_api_login', methods: ['POST'])]
    public function index(#[CurrentUser] ?User $user)
    {
        if (null === $user) {
            return $this->json([
               'message' => 'missing credentials',
            ], Response::HTTP_UNAUTHORIZED);
        }
        $token = uniqid();
        return $this->json([
            'user'  => $user->getUserIdentifier(),
            'userId' => $user->getId(),
            'token' => $token,
        ]);
    }
}
