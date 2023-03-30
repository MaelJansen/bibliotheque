<?php

namespace App\Controller;

use App\Entity\User;
use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Security\Http\Attribute\CurrentUser;

class ApiLoginController extends AbstractController
{
    #[Route('/api/login', name: 'app_api_login')]
    public function index(#[CurrentUser] ?User $user, Request $request, UserRepository $repository, EntityManagerInterface $entityManager)
    {
        if (null === $user) {
            return $this->json([
               'message' => 'missing credentials',
            ], Response::HTTP_UNAUTHORIZED);
        }

        $token = uniqid();
        return $this->json([
            'user'  => $user->getUserIdentifier(),
            'token' => $token,
        ]);
    }
}
