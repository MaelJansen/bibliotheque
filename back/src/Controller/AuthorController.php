<?php

namespace App\Controller;

use App\Repository\AuthorRepository;
use Error;
use Exception;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\Routing\Annotation\Route;
use FOS\RestBundle\Controller\Annotations\View;
use Symfony\Component\BrowserKit\Response;

use function PHPUnit\Framework\throwException;

#[Route('/api/authors')]
class AuthorController extends AbstractController
{
    #[View(serializerGroups: ['author_name'])]
    #[Route('/', name: 'app_author')]
    public function index(AuthorRepository $repository)
    {
        if (isset($_GET['q'])) {
            return $repository->getAuthorByName($_GET['q']);
        } else {
            throw new Exception("Missing query string");
        }
    }
}
