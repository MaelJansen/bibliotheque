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
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $AUTName = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getAUTName(): ?string
    {
        return $this->AUTName;
    }

    public function setAUTName(string $AUTName): self
    {
        $this->AUTName = $AUTName;

        return $this;
    }
}