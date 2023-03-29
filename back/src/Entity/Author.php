<?php

namespace App\Entity;

use App\Repository\AuthorRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use App\Entity\OA\Property;

#[ORM\Entity(repositoryClass: AuthorRepository::class)]
class Author
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['author_infos'])]
    #[OA\Property(example: "1")]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['preview', 'book_infos', 'author_infos'])]
    #[OA\Property(example: "Eliza Bradley")]
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
