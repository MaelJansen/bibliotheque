<?php

namespace App\Repository;

use App\Entity\Book;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Persistence\ManagerRegistry;

/**
 * @extends ServiceEntityRepository<Book>
 *
 * @method Book|null find($id, $lockMode = null, $lockVersion = null)
 * @method Book|null findOneBy(array $criteria, array $orderBy = null)
 * @method Book[]    findAll()
 * @method Book[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class BookRepository extends ServiceEntityRepository
{
    public function __construct(ManagerRegistry $registry)
    {
        parent::__construct($registry, Book::class);
    }

    public function save(Book $entity, bool $flush = false): void
    {
        $this->getEntityManager()->persist($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function remove(Book $entity, bool $flush = false): void
    {
        $this->getEntityManager()->remove($entity);

        if ($flush) {
            $this->getEntityManager()->flush();
        }
    }

    public function getOneBook(int $id): array
    {
        return $this->createQueryBuilder('b')
            ->andWhere('b.id = :val')
            ->setParameter('val', $id)
            ->setMaxResults(10)
            ->getQuery()
            ->getResult();
    }

    public function getPopularBooks(int $nbBooks): array
    {
        return $this->createQueryBuilder('b')
            ->select('b', 'COUNT(ub.USBUser) as nb_reads')
            ->join('b.BOOBorrows', 'ub')
            ->groupBy('b.id')
            ->orderBy('nb_reads', 'DESC')
            ->setMaxResults($nbBooks)
            ->getQuery()
            ->getResult();
    }

    public function getLastBook(): array
    {
        return $this->createQueryBuilder('b')
            ->orderBy('b.BOOReceivingDate', 'DESC')
            ->setMaxResults(4)
            ->getQuery()
            ->getResult();
    }

    public function findByAuthor(string $author)
    {
        return $this->createQueryBuilder('b')
            ->join('b.BOOAuthor', 'a')
            ->andWhere('a.AUTName LIKE :val')
            ->setParameter('val', '%' . $author . '%')
            ->orderBy('b.id', 'ASC')
            ->getQuery()
            ->getResult();
    }

    public function findByAuthorAndPages(string $author, int $nbResult, int $page)
    {
        return $this->createQueryBuilder('b')
            ->join('b.BOOAuthor', 'a')
            ->andWhere('a.AUTName LIKE :val')
            ->setParameter('val', '%' . $author . '%')
            ->andWhere('b.id > :index')
            ->orderBy('b.id', 'ASC')
            ->setMaxResults($nbResult)
            ->getQuery()
            ->getResult();
    }

    //    /**
    //     * @return Book[] Returns an array of Book objects
    //     */
    //    public function findByExampleField($value): array
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->orderBy('b.id', 'ASC')
    //            ->setMaxResults(10)
    //            ->getQuery()
    //            ->getResult()
    //        ;
    //    }

    //    public function findOneBySomeField($value): ?Book
    //    {
    //        return $this->createQueryBuilder('b')
    //            ->andWhere('b.exampleField = :val')
    //            ->setParameter('val', $value)
    //            ->getQuery()
    //            ->getOneOrNullResult()
    //        ;
    //    }
}
