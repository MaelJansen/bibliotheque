<?php

namespace App\Entity;

use App\Repository\CategoriesRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: CategoriesRepository::class)]
class Categories
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Groups('book_infos')]
    #[ORM\Column(length: 255)]
    private ?string $CATName = null;

    public function getCATId(): ?int
    {
        return $this->id;
    }

    public function setCATId(int $CATId): self
    {
        $this->id = $CATId;

        return $this;
    }

    public function getCATName(): ?string
    {
        return $this->CATName;
    }

    public function setCATName(string $CATName): self
    {
        $this->CATName = $CATName;

        return $this;
    }
}
