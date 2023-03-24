<?php

namespace App\Entity;

use App\Repository\UserBookRepository;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: UserBookRepository::class)]
class UserBook
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(nullable: true)]
    private ?int $USBGrade = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $USBDateBorrowed = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $USBDateGivenBack = null;

    #[ORM\ManyToOne(inversedBy: 'USRBorrowedBooks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $USBIdUser = null;

    #[ORM\ManyToOne(inversedBy: 'BOOBorrows')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Book $USBBook = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUSBGrade(): ?int
    {
        return $this->USBGrade;
    }

    public function setUSBGrade(?int $USBGrade): self
    {
        $this->USBGrade = $USBGrade;

        return $this;
    }

    public function getUSBDateBorrowed(): ?\DateTimeInterface
    {
        return $this->USBDateBorrowed;
    }

    public function setUSBDateBorrowed(\DateTimeInterface $USBDateBorrowed): self
    {
        $this->USBDateBorrowed = $USBDateBorrowed;

        return $this;
    }

    public function getUSBDateGivenBack(): ?\DateTimeInterface
    {
        return $this->USBDateGivenBack;
    }

    public function setUSBDateGivenBack(?\DateTimeInterface $USBDateGivenBack): self
    {
        $this->USBDateGivenBack = $USBDateGivenBack;

        return $this;
    }

    public function getUSBIdUser(): ?User
    {
        return $this->USBIdUser;
    }

    public function setUSBIdUser(?User $USBIdUser): self
    {
        $this->USBIdUser = $USBIdUser;

        return $this;
    }

    public function getUSBBook(): ?Book
    {
        return $this->USBBook;
    }

    public function setUSBBook(?Book $USBBook): self
    {
        $this->USBBook = $USBBook;

        return $this;
    }
}
