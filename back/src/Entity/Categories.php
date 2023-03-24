<?php

namespace App\Entity;

use App\Repository\CategoriesRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: CategoriesRepository::class)]
class Categories
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $CAT_Name = null;

    public function getCATId(): ?int
    {
        return $this->id;
    }

    public function setCATId(int $CAT_Id): self
    {
        $this->CAT_Id = $CAT_Id;

        return $this;
    }

    public function getCATName(): ?string
    {
        return $this->CAT_Name;
    }

    public function setCATName(string $CAT_Name): self
    {
        $this->CAT_Name = $CAT_Name;

        return $this;
    }
}
