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

    #[ORM\Column(length: 255)]
    private ?string $BOO_Name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $BOO_Summary = null;

    #[ORM\Column(nullable: true)]
    private ?int $BOO_NbPages = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $BOO_LinkImg = null;

    #[ORM\ManyToMany(targetEntity: Categories::class)]
    private Collection $BOO_Categories;

    #[ORM\ManyToMany(targetEntity: Language::class)]
    private Collection $BOO_Languages;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: false)]
    private ?Editor $BOO_Editor = null;

    #[ORM\ManyToMany(targetEntity: Author::class)]
    private Collection $BOO_Author;

    #[ORM\OneToMany(mappedBy: 'USB_Book', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $BOO_Borrows;

    public function __construct()
    {
        $this->BOO_Categories = new ArrayCollection();
        $this->BOO_Languages = new ArrayCollection();
        $this->BOO_Author = new ArrayCollection();
        $this->BOO_Borrows = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getBOOName(): ?string
    {
        return $this->BOO_Name;
    }

    public function setBOOName(string $BOO_Name): self
    {
        $this->BOO_Name = $BOO_Name;

        return $this;
    }

    public function getBOOSummary(): ?string
    {
        return $this->BOO_Summary;
    }

    public function setBOOSummary(?string $BOO_Summary): self
    {
        $this->BOO_Summary = $BOO_Summary;

        return $this;
    }

    public function getBOONbPages(): ?int
    {
        return $this->BOO_NbPages;
    }

    public function setBOONbPages(?int $BOO_NbPages): self
    {
        $this->BOO_NbPages = $BOO_NbPages;

        return $this;
    }

    public function getBOOLinkImg(): ?string
    {
        return $this->BOO_LinkImg;
    }

    public function setBOOLinkImg(?string $BOO_LinkImg): self
    {
        $this->BOO_LinkImg = $BOO_LinkImg;

        return $this;
    }

    /**
     * @return Collection<int, Categories>
     */
    public function getBOOCategories(): Collection
    {
        return $this->BOO_Categories;
    }

    public function addBOOCategory(Categories $bOOCategory): self
    {
        if (!$this->BOO_Categories->contains($bOOCategory)) {
            $this->BOO_Categories->add($bOOCategory);
        }

        return $this;
    }

    public function removeBOOCategory(Categories $bOOCategory): self
    {
        $this->BOO_Categories->removeElement($bOOCategory);

        return $this;
    }

    /**
     * @return Collection<int, Language>
     */
    public function getBOOLanguages(): Collection
    {
        return $this->BOO_Languages;
    }

    public function addBOOLanguage(Language $bOOLanguage): self
    {
        if (!$this->BOO_Languages->contains($bOOLanguage)) {
            $this->BOO_Languages->add($bOOLanguage);
        }

        return $this;
    }

    public function removeBOOLanguage(Language $bOOLanguage): self
    {
        $this->BOO_Languages->removeElement($bOOLanguage);

        return $this;
    }

    public function getBOOEditor(): ?Editor
    {
        return $this->BOO_Editor;
    }

    public function setBOOEditor(?Editor $BOO_Editor): self
    {
        $this->BOO_Editor = $BOO_Editor;

        return $this;
    }

    /**
     * @return Collection<int, Author>
     */
    public function getBOOAuthor(): Collection
    {
        return $this->BOO_Author;
    }

    public function addBOOAuthor(Author $bOOAuthor): self
    {
        if (!$this->BOO_Author->contains($bOOAuthor)) {
            $this->BOO_Author->add($bOOAuthor);
        }

        return $this;
    }

    public function removeBOOAuthor(Author $bOOAuthor): self
    {
        $this->BOO_Author->removeElement($bOOAuthor);

        return $this;
    }

    /**
     * @return Collection<int, UserBook>
     */
    public function getBOOBorrows(): Collection
    {
        return $this->BOO_Borrows;
    }

    public function addBOOBorrow(UserBook $bOOBorrow): self
    {
        if (!$this->BOO_Borrows->contains($bOOBorrow)) {
            $this->BOO_Borrows->add($bOOBorrow);
            $bOOBorrow->setUSBBook($this);
        }

        return $this;
    }

    public function removeBOOBorrow(UserBook $bOOBorrow): self
    {
        if ($this->BOO_Borrows->removeElement($bOOBorrow)) {
            // set the owning side to null (unless already changed)
            if ($bOOBorrow->getUSBBook() === $this) {
                $bOOBorrow->setUSBBook(null);
            }
        }

        return $this;
    }
}
