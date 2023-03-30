<?php

namespace App\Tests;

use PHPUnit\Framework\TestCase;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;
use App\Entity\Book;
use App\Entity\Author;

class DatabaseTest extends KernelTestCase
{
    public function testNumBooks(): void
    {
        $entityManager = self::bootKernel()->getContainer()
            ->get('doctrine')
            ->getManager();
        $bookRepository = $entityManager->getRepository(Book::class);
        $books = $bookRepository->findAll();
        
        // assert if books >= 200
        $this->assertGreaterThanOrEqual(200, count($books));
    }

    public function testNumAuthors(): void
    {
        $entityManager = self::bootKernel()->getContainer()
            ->get('doctrine')
            ->getManager();
        $authorRepository = $entityManager->getRepository(Author::class);
        $authors = $authorRepository->findAll();

        // assert if authors >= 50
        $this->assertGreaterThanOrEqual(50, count($authors));
    }
}
