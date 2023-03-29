<?php

namespace App\Controller;

use Symfony\Component\Routing\Annotation\Route;
use App\Repository\UserRepository;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Doctrine\ORM\EntityManagerInterface;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class ApiLoginController extends AbstractController
{
    #[Route('/api/login', name: 'app_api_login')]
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
