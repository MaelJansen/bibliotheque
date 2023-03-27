<?php

namespace App\Entity;

use App\Repository\BookRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: BookRepository::class)]
class Book
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 2000)]
    private ?string $BOOName = null;

    #[ORM\Column(length: 5000, nullable: true)]
    private ?string $BOOSummary = null;

    #[ORM\Column(nullable: true)]
    private ?int $BOONbPages = null;

    #[ORM\Column(length: 5000, nullable: true)]
    private ?string $BOOLinkImg = null;

    #[ORM\ManyToOne(targetEntity: Categories::class)]
    private Categories $BOOCategory;

    #[ORM\ManyToMany(targetEntity: Language::class)]
    private Collection $BOOLanguages;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true)]
    private ?Editor $BOOEditor = null;

    #[ORM\ManyToMany(targetEntity: Author::class)]
    private Collection $BOOAuthor;

    #[ORM\OneToMany(mappedBy: 'USBBook', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $BOOBorrows;

    public function construct()
    {
        $this->BOOLanguages = new ArrayCollection();
        $this->BOOAuthor = new ArrayCollection();
        $this->BOOBorrows = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBOOName(): ?string
    {
        return $this->BOOName;
    }

    public function setBOOName(string $BOOName): self
    {
        $this->BOOName = $BOOName;

        return $this;
    }

    public function getBOOSummary(): ?string
    {
        return $this->BOOSummary;
    }

    public function setBOOSummary(?string $BOOSummary): self
    {
        $this->BOOSummary = $BOOSummary;

        return $this;
    }

    public function getBOONbPages(): ?int
    {
        return $this->BOONbPages;
    }

    public function setBOONbPages(?int $BOONbPages): self
    {
        $this->BOONbPages = $BOONbPages;

        return $this;
    }

    public function getBOOLinkImg(): ?string
    {
        return $this->BOOLinkImg;
    }

    public function setBOOLinkImg(?string $BOOLinkImg): self
    {
        $this->BOOLinkImg = $BOOLinkImg;

        return $this;
    }

    public function getBOOCategory(): Categories
    {
        return $this->BOOCategory;
    }

    public function setBOOCategory(?Categories $category): self
    {
        $this->BOOCategory = $category;
        return $this;
    }

    /**
     * @return Collection<int, Language>
     */
    public function getBOOLanguages(): Collection
    {
        return $this->BOOLanguages;
    }

    public function addBOOLanguage(Language $bOOLanguage): self
    {
        if (!$this->BOOLanguages->contains($bOOLanguage)) {
            $this->BOOLanguages->add($bOOLanguage);
        }

        return $this;
    }

    public function removeBOOLanguage(Language $bOOLanguage): self
    {
        $this->BOOLanguages->removeElement($bOOLanguage);

        return $this;
    }

    public function getBOOEditor(): ?Editor
    {
        return $this->BOOEditor;
    }

    public function setBOOEditor(?Editor $BOOEditor): self
    {
        $this->BOOEditor = $BOOEditor;

        return $this;
    }

    /**
     * @return Collection<int, Author>
     */
    public function getBOOAuthor(): Collection
    {
        return $this->BOOAuthor;
    }

    public function addBOOAuthor(Author $bOOAuthor): self
    {
        if (!$this->BOOAuthor->contains($bOOAuthor)) {
            $this->BOOAuthor->add($bOOAuthor);
        }

        return $this;
    }

    public function removeBOOAuthor(Author $bOOAuthor): self
    {
        $this->BOOAuthor->removeElement($bOOAuthor);

        return $this;
    }

    /**
     * @return Collection<int, UserBook>
     */
    public function getBOOBorrows(): Collection
    {
        return $this->BOOBorrows;
    }

    public function addBOOBorrow(UserBook $bOOBorrow): self
    {
        if (!$this->BOOBorrows->contains($bOOBorrow)) {
            $this->BOOBorrows->add($bOOBorrow);
            $bOOBorrow->setUSBBook($this);
        }

        return $this;
    }

    public function removeBOOBorrow(UserBook $bOOBorrow): self
    {
        if ($this->BOOBorrows->removeElement($bOOBorrow)) {
            // set the owning side to null (unless already changed)
            if ($bOOBorrow->getUSBBook() === $this) {
                $bOOBorrow->setUSBBook(null);
            }
        }

        return $this;
    }
}
