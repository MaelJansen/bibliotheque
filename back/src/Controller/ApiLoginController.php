<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

class ApiLoginController extends AbstractController
{
    #[Route('/api/login', name: 'app_api_login')]
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
