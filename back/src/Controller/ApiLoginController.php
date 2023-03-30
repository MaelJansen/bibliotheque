<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use OpenApi\Attributes as OA;

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
    public function index(Request $request, UserRepository $repository, EntityManagerInterface $entityManager)
    {
        $email = $request->request->get('email');
        if ($email != null) {
            $user = $repository->getOneUserByEmail($email);
            if (null === $user) {
                throw new HttpException(401, 'Unauthorized');
            }
            $token = uniqid();
            $user->setToken($token);
            $entityManager->persist($user);
            $entityManager->flush();
            return $this->json([
                'user'  => $user->getUserIdentifier(),
                'token' => $token,
            ]);
        } else {
            throw new HttpException(400, 'Missing email');
        }
    }
}
