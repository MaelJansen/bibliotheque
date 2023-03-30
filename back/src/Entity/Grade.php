<?php

namespace App\Entity;

use App\Repository\GradeRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: GradeRepository::class)]
class Grade
{
    #[ORM\Id]
    #[ORM\ManyToOne(inversedBy: 'BOOGrades')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Book $GRABook = null;

    #[ORM\Id]
    #[ORM\ManyToOne(inversedBy: 'USRGrades')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $GRAUser = null;

    #[Groups('book_grade')]
    #[ORM\Column]
    private ?int $GRARate = null;

    public function getGRABook(): ?Book
    {
        return $this->GRABook;
    }

    public function setGRABook(?Book $GRABookId): self
    {
        $this->GRABook = $GRABookId;

        return $this;
    }

    public function getGRAUser(): ?User
    {
        return $this->GRAUser;
    }

    public function setGRAUser(?User $GRAUser): self
    {
        $this->GRAUser = $GRAUser;

        return $this;
    }

    public function getGRARate(): ?int
    {
        return $this->GRARate;
    }

    public function setGRARate(int $rate): self
    {
        $this->GRARate = $rate;

        return $this;
    }
}
