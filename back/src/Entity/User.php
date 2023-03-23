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
    private ?string $USR_Name = null;

    #[ORM\Column(length: 255)]
    private ?string $USR_FirstName = null;

    #[ORM\Column(length: 255)]
    private ?string $USR_Email = null;

    #[ORM\Column(length: 255)]
    private ?string $USR_Password = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $USR_ProfilePicture = null;

    #[ORM\ManyToMany(targetEntity: self::class, inversedBy: 'USR_FollowingUsers')]
    private Collection $USR_FollowedUsers;

    #[ORM\ManyToMany(targetEntity: self::class, mappedBy: 'USR_FollowedUsers')]
    private Collection $USR_FollowingUsers;

    #[ORM\OneToMany(mappedBy: 'USB_IdUser', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $USR_BorrowedBooks;

    public function __construct()
    {
        $this->USR_FollowedUsers = new ArrayCollection();
        $this->USR_FollowingUsers = new ArrayCollection();
        $this->USR_BorrowedBooks = new ArrayCollection();
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    public function getUSRName(): ?string
    {
        return $this->USR_Name;
    }

    public function setUSRName(string $USR_Name): self
    {
        $this->USR_Name = $USR_Name;

        return $this;
    }

    public function getUSRFirstName(): ?string
    {
        return $this->USR_FirstName;
    }

    public function setUSRFirstName(string $USR_FirstName): self
    {
        $this->USR_FirstName = $USR_FirstName;

        return $this;
    }

    public function getUSREmail(): ?string
    {
        return $this->USR_Email;
    }

    public function setUSREmail(string $USR_Email): self
    {
        $this->USR_Email = $USR_Email;

        return $this;
    }

    public function getUSRPassword(): ?string
    {
        return $this->USR_Password;
    }

    public function setUSRPassword(string $USR_Password): self
    {
        $this->USR_Password = $USR_Password;

        return $this;
    }

    public function getUSRProfilePicture(): ?string
    {
        return $this->USR_ProfilePicture;
    }

    public function setUSRProfilePicture(?string $USR_ProfilePicture): self
    {
        $this->USR_ProfilePicture = $USR_ProfilePicture;

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getUSRFollowedUsers(): Collection
    {
        return $this->USR_FollowedUsers;
    }

    public function addUSRFollowedUser(self $uSRFollowedUser): self
    {
        if (!$this->USR_FollowedUsers->contains($uSRFollowedUser)) {
            $this->USR_FollowedUsers->add($uSRFollowedUser);
        }

        return $this;
    }

    public function removeUSRFollowedUser(self $uSRFollowedUser): self
    {
        $this->USR_FollowedUsers->removeElement($uSRFollowedUser);

        return $this;
    }

    /**
     * @return Collection<int, self>
     */
    public function getUSRFollowingUsers(): Collection
    {
        return $this->USR_FollowingUsers;
    }

    public function addUSRFollowingUser(self $uSRFollowingUser): self
    {
        if (!$this->USR_FollowingUsers->contains($uSRFollowingUser)) {
            $this->USR_FollowingUsers->add($uSRFollowingUser);
            $uSRFollowingUser->addUSRFollowedUser($this);
        }

        return $this;
    }

    public function removeUSRFollowingUser(self $uSRFollowingUser): self
    {
        if ($this->USR_FollowingUsers->removeElement($uSRFollowingUser)) {
            $uSRFollowingUser->removeUSRFollowedUser($this);
        }

        return $this;
    }

    /**
     * @return Collection<int, UserBook>
     */
    public function getUSRBorrowedBooks(): Collection
    {
        return $this->USR_BorrowedBooks;
    }

    public function addUSRBorrowedBook(UserBook $uSRBorrowedBook): self
    {
        if (!$this->USR_BorrowedBooks->contains($uSRBorrowedBook)) {
            $this->USR_BorrowedBooks->add($uSRBorrowedBook);
            $uSRBorrowedBook->setUSBIdUser($this);
        }

        return $this;
    }

    public function removeUSRBorrowedBook(UserBook $uSRBorrowedBook): self
    {
        if ($this->USR_BorrowedBooks->removeElement($uSRBorrowedBook)) {
            // set the owning side to null (unless already changed)
            if ($uSRBorrowedBook->getUSBIdUser() === $this) {
                $uSRBorrowedBook->setUSBIdUser(null);
            }
        }

        return $this;
    }
}
