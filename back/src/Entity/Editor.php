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
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $EDIName = null;

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getEDIName(): ?string
    {
        return $this->EDIName;
    }

    public function setEDIName(string $EDIName): self
    {
        $this->EDIName = $EDIName;

        return $this;
    }

}
