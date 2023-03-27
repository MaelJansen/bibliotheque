<?php

namespace App\Entity;

use App\Repository\LanguageRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: LanguageRepository::class)]
class Language
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Groups('book_infos')]
    #[ORM\Column(length: 255)]
    private ?string $LANName = null;

    public function getLANId(): ?int
    {
        return $this->id;
    }

    public function getLANName(): ?string
    {
        return $this->LANName;
    }

    public function setLANName(string $LANName): self
    {
        $this->LANName = $LANName;

        return $this;
    }
}
