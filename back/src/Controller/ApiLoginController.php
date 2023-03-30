<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use OpenApi\Attributes as OA;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\HttpFoundation\Request;
use Nelmio\ApiDocBundle\Annotation\Security;
use Sensio\Bundle\FrameworkExtraBundle\Configuration\IsGranted;

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
            ref: "#/components/schemas/LoginUser"
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
    #[Route('/api/login', name: 'app_api_login', methods: ['POST'])]
    public function index(#[CurrentUser] ?User $user, UserRepository $repository)
    {
        if (null === $user) {
            return $this->json([
               'message' => 'missing credentials',
            ], Response::HTTP_UNAUTHORIZED);
        }
        $token = uniqid();
        $user->setToken($token);
        $repository->save($user, true);
        return $this->json([
            'user'  => $user->getUserIdentifier(),
            'userId' => $user->getId(),
            'token' => $token,
        ]);
    }

    #[OA\Post(
        summary: "Déconnecte un utilisateur"
    )]
    #[OA\Response(
        response: 200,
        description: "Déconnecte un utilisateur",
        content: new OA\JsonContent(
            ref: "#/components/schemas/LogoutUser"
        )
    )]
    #[IsGranted("ROLE_USER")]
    #[Security(name: "Bearer")]
    #[Route('/api/logout', methods: ['POST'])]
    public function logout(UserRepository $userRepository, Request $request)
    {
        $token = $request->headers->get('Authorization');
        $token = substr($token, 7);
        $user = $userRepository->getUserByToken($token);
        $user->setToken(null);
        $userRepository->save($user, true);
        return $this->json(['userID' => $user->getId()]);
    }
}
