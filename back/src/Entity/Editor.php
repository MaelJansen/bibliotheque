<?php

namespace App\Entity;

use App\Repository\EditorRepository;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: EditorRepository::class)]
class Editor
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $EDI_Id = null;

    #[ORM\Column(length: 255)]
    private ?string $EDI_Name = null;

    public function getId(): ?int
    {
        return $this->EDI_Id;
    }

    public function getEDIName(): ?string
    {
        return $this->EDI_Name;
    }

    public function setEDIName(string $EDI_Name): self
    {
        $this->EDI_Name = $EDI_Name;

        return $this;
    }
}
