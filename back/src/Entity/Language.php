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

    #[ORM\Column(length: 255)]
    private ?string $LAN_Name = null;

    public function getLAN_Id(): ?int
    {
        return $this->id;
    }

    public function getLANName(): ?string
    {
        return $this->LAN_Name;
    }

    public function setLANName(string $LAN_Name): self
    {
        $this->LAN_Name = $LAN_Name;

        return $this;
    }
}
