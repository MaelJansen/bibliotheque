<?php

namespace App\Controller;

use App\Entity\User;
use App\Repository\UserRepository;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\CurrentUser;
use Symfony\Component\HttpFoundation\Request;

class ApiLoginController extends AbstractController
{
    #[Route('/api/login', name: 'app_api_login')]
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
