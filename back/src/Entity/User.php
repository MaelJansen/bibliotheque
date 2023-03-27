<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;

#[ORM\Entity(repositoryClass: UserRepository::class)]
class User
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    private ?string $USRName = null;

    #[ORM\Column(length: 255)]
    private ?string $USRFirstName = null;

    #[ORM\Column(length: 255)]
    private ?string $USREmail = null;

    #[ORM\Column(length: 255)]
    private ?string $USRPassword = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $USRProfilePicture = null;

    #[ORM\ManyToMany(targetEntity: self::class, inversedBy: 'USRFollowingUsers')]
    private Collection $USRFollowedUsers;

    #[ORM\ManyToMany(targetEntity: self::class, mappedBy: 'USRFollowedUsers')]
    private Collection $USRFollowingUsers;

    #[ORM\OneToMany(mappedBy: 'USBIdUser', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $USRBorrowedBooks;

    public function construct()
    {
        $this->USRFollowedUsers = new ArrayCollection();
        $this->USRFollowingUsers = new ArrayCollection();
        $this->USRBorrowedBooks = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUSRName(): ?string
    {
        return $this->USRName;
    }

    public function setUSRName(string $USRName): self
    {
        $this->USRName = $USRName;

        return $this;
    }

    public function getUSRFirstName(): ?string
    {
        return $this->USRFirstName;
    }

    public function setUSRFirstName(string $USRFirstName): self
    {
        $this->USRFirstName = $USRFirstName;

        return $this;
    }

    public function getUSREmail(): ?string
    {
        return $this->USREmail;
    }

    public function setUSREmail(string $USREmail): self
    {
        $this->USREmail = $USREmail;

        return $this;
    }

    public function getUSRPassword(): ?string
    {
        return $this->USRPassword;
    }

    public function setUSRPassword(string $USRPassword): self
    {
        $this->USRPassword = $USRPassword;

        return $this;
    }

    public function getUSRProfilePicture(): ?string
    {
        return $this->USRProfilePicture;
    }

    public function setUSRProfilePicture(?string $USRProfilePicture): self
    {
        $this->USRProfilePicture = $USRProfilePicture;

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getUSRFollowedUsers(): Collection
    {
        return $this->USRFollowedUsers;
    }

    public function addUSRFollowedUser(self $uSRFollowedUser): self
    {
        if (!$this->USRFollowedUsers->contains($uSRFollowedUser)) {
            $this->USRFollowedUsers->add($uSRFollowedUser);
        }

        return $this;
    }

    public function removeUSRFollowedUser(self $uSRFollowedUser): self
    {
        $this->USRFollowedUsers->removeElement($uSRFollowedUser);

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getUSRFollowingUsers(): Collection
    {
        return $this->USRFollowingUsers;
    }

    public function addUSRFollowingUser(self $uSRFollowingUser): self
    {
        if (!$this->USRFollowingUsers->contains($uSRFollowingUser)) {
            $this->USRFollowingUsers->add($uSRFollowingUser);
            $uSRFollowingUser->addUSRFollowedUser($this);
        }

        return $this;
    }

    public function removeUSRFollowingUser(self $uSRFollowingUser): self
    {
        if ($this->USRFollowingUsers->removeElement($uSRFollowingUser)) {
            $uSRFollowingUser->removeUSRFollowedUser($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, UserBook>
     */
    public function getUSRBorrowedBooks(): Collection
    {
        return $this->USRBorrowedBooks;
    }

    public function addUSRBorrowedBook(UserBook $uSRBorrowedBook): self
    {
        if (!$this->USRBorrowedBooks->contains($uSRBorrowedBook)) {
            $this->USRBorrowedBooks->add($uSRBorrowedBook);
            $uSRBorrowedBook->setUSBIdUser($this);
        }

        return $this;
    }

    public function removeUSRBorrowedBook(UserBook $uSRBorrowedBook): self
    {
        if ($this->USRBorrowedBooks->removeElement($uSRBorrowedBook)) {
            // set the owning side to null (unless already changed)
            if ($uSRBorrowedBook->getUSBIdUser() === $this) {
                $uSRBorrowedBook->setUSBIdUser(null);
            }
        }

        return $this;
    }
}
