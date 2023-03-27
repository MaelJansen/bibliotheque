<?php

namespace App\Entity;

use App\Repository\BookRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\DBAL\Types\Types;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Serializer\Annotation\Context;

#[ORM\Entity(repositoryClass: BookRepository::class)]
class Book
{
    #[Context (groups:["preview"])]

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups('preview')]
    private ?int $id = null;

    #[Groups('preview')]
    #[ORM\Column(length: 2000)]
    private ?string $BOOName = null;

    #[ORM\Column(length: 5000, nullable: true)]
    private ?string $BOOSummary = null;

    #[ORM\Column(nullable: true)]
    private ?int $BOONbPages = null;

    #[Groups('preview')]
    #[ORM\Column(length: 5000, nullable: true)]
    private ?string $BOOLinkImg = null;

    #[ORM\ManyToOne(targetEntity: Categories::class)]
    private Categories $BOOCategory;

    #[ORM\ManyToMany(targetEntity: Language::class)]
    private Collection $BOOLanguages;

    #[ORM\ManyToOne]
    #[ORM\JoinColumn(nullable: true)]
    private ?Editor $BOOEditor = null;

    #[Groups('preview')]
    #[ORM\ManyToMany(targetEntity: Author::class)]
    private Collection $BOOAuthor;

    #[ORM\OneToMany(mappedBy: 'USBBook', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $BOOBorrows;

    #[Groups('preview')]
    #[ORM\Column(type: Types::DATE_MUTABLE, nullable: true)]
    private ?\DateTime $BOOPublishDate = null;

    #[ORM\OneToMany(mappedBy: 'GRABookId', targetEntity: Grade::class, orphanRemoval: true)]
    private Collection $BOOGrades;

    public function __construct()
    {
        $this->BOOGrades = new ArrayCollection();
    }

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

    public function getBOOPublishDate(): ?\DateTimeInterface
    {
        return $this->BOOPublishDate;
    }

    public function setBOOPublishDate(?\DateTimeInterface $BOOPublishDate): self
    {
        $this->BOOPublishDate = $BOOPublishDate;

        return $this;
    }

    /**
     * @return Collection<int, Grade>
     */
    public function getBOOGrades(): Collection
    {
        return $this->BOOGrades;
    }

    public function addBOOGrade(Grade $bOOGrade): self
    {
        if (!$this->BOOGrades->contains($bOOGrade)) {
            $this->BOOGrades->add($bOOGrade);
            $bOOGrade->setGRABook($this);
        }

        return $this;
    }

    public function removeBOOGrade(Grade $bOOGrade): self
    {
        if ($this->BOOGrades->removeElement($bOOGrade)) {
            // set the owning side to null (unless already changed)
            if ($bOOGrade->getGRABook() === $this) {
                $bOOGrade->setGRABook(null);
            }
        }

        return $this;
    }
}
