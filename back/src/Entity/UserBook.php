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
    private ?int $USB_Grade = null;

    #[ORM\Column(type: Types::DATE_MUTABLE)]
    private ?\DateTimeInterface $USB_DateBorrowed = null;

    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTimeInterface $USB_DateGivenBack = null;

    #[ORM\ManyToOne(inversedBy: 'USR_BorrowedBooks')]
    #[ORM\JoinColumn(nullable: false)]
    private ?User $USB_IdUser = null;

    #[ORM\ManyToOne(inversedBy: 'BOO_Borrows')]
    #[ORM\JoinColumn(nullable: false)]
    private ?Book $USB_Book = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUSBGrade(): ?int
    {
        return $this->USB_Grade;
    }

    public function setUSBGrade(?int $USB_Grade): self
    {
        $this->USB_Grade = $USB_Grade;

        return $this;
    }

    public function getUSBDateBorrowed(): ?\DateTimeInterface
    {
        return $this->USB_DateBorrowed;
    }

    public function setUSBDateBorrowed(\DateTimeInterface $USB_DateBorrowed): self
    {
        $this->USB_DateBorrowed = $USB_DateBorrowed;

        return $this;
    }

    public function getUSBDateGivenBack(): ?\DateTimeInterface
    {
        return $this->USB_DateGivenBack;
    }

    public function setUSBDateGivenBack(?\DateTimeInterface $USB_DateGivenBack): self
    {
        $this->USB_DateGivenBack = $USB_DateGivenBack;

        return $this;
    }

    public function getUSBIdUser(): ?User
    {
        return $this->USB_IdUser;
    }

    public function setUSBIdUser(?User $USB_IdUser): self
    {
        $this->USB_IdUser = $USB_IdUser;

        return $this;
    }

    public function getUSBBook(): ?Book
    {
        return $this->USB_Book;
    }

    public function setUSBBook(?Book $USB_Book): self
    {
        $this->USB_Book = $USB_Book;

        return $this;
    }
}
