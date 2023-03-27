<?php

namespace App\Entity;

use App\Repository\EditorRepository;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;

#[ORM\Entity(repositoryClass: EditorRepository::class)]
class Editor
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[Groups('book_infos')]
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
