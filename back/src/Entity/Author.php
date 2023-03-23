<?php

namespace App\Entity;

use App\Repository\AuthorRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: AuthorRepository::class)]
class Author
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $AUT_Id = null;

    #[ORM\Column(length: 255)]
    private ?string $AUT_Name = null;

    public function getId(): ?int
    {
        return $this->AUT_Id;
    }

    public function getAUTName(): ?string
    {
        return $this->AUT_Name;
    }

    public function setAUTName(string $AUT_Name): self
    {
        $this->AUT_Name = $AUT_Name;

        return $this;
    }
}
