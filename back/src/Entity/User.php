<?php

namespace App\Entity;

use App\Repository\UserRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Symfony\Component\Serializer\Annotation\Groups;
use Symfony\Component\Security\Core\User\PasswordAuthenticatedUserInterface;
use Symfony\Component\Security\Core\User\UserInterface;
use OpenApi\Attributes as OA;

#[ORM\Entity(repositoryClass: UserRepository::class)]
class User implements PasswordAuthenticatedUserInterface, UserInterface
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    #[Groups(['last_books', 'user_infos'])]
    #[OA\Property(example: "1")]
    private ?int $id = null;

    #[ORM\Column(length: 255)]
    #[Groups(['last_books', 'user_infos'])]
    #[OA\Property(example: "Gonzalez")]
    private ?string $USRName = null;

    #[ORM\Column(length: 255)]
    #[Groups(['last_books', 'user_infos'])]
    #[OA\Property(example: "Constance")]
    private ?string $USRFirstName = null;

    #[ORM\Column(length: 255)]
    #[Groups(['user_infos', 'user_new'])]
    #[OA\Property(example: "constance.gonzalez@example.com")]
    private ?string $USREmail = null;

    #[ORM\Column(length: 255)]
    #[Groups(['user_new'])]
    #[OA\Property(example: "testtest")]
    private ?string $USRPassword = null;

    #[Groups(['last_books', 'user_infos'])]
    #[ORM\Column(length: 255, nullable: true)]
    #[OA\Property(example: "https://randomuser.me/api/portraits/women/66.jpg")]
    private ?string $USRProfilePicture = null;

    #[ORM\ManyToMany(targetEntity: self::class, inversedBy: 'USRFollowingUsers')]
    private Collection $USRFollowedUsers;

    #[ORM\ManyToMany(targetEntity: self::class, mappedBy: 'USRFollowedUsers')]
    private Collection $USRFollowingUsers;

    #[ORM\OneToMany(mappedBy: 'USBUser', targetEntity: UserBook::class, orphanRemoval: true)]
    private Collection $USRBorrowedBooks;

    #[ORM\OneToMany(mappedBy: 'GRAUserId', targetEntity: Grade::class, orphanRemoval: true)]
    private Collection $USRGrades;

    #[ORM\Column(nullable: true)]
    private ?string $token = null;

    public function __construct()
    {
        $this->USRGrades = new ArrayCollection();
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
            $uSRBorrowedBook->setUSBUser($this);
        }

        return $this;
    }

    public function removeUSRBorrowedBook(UserBook $uSRBorrowedBook): self
    {
        if ($this->USRBorrowedBooks->removeElement($uSRBorrowedBook)) {
            // set the owning side to null (unless already changed)
            if ($uSRBorrowedBook->getUSBUser() === $this) {
                $uSRBorrowedBook->setUSBUser(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Grade>
     */
    public function getUSRGrades(): Collection
    {
        return $this->USRGrades;
    }

    public function addUSRGrade(Grade $uSRGrade): self
    {
        if (!$this->USRGrades->contains($uSRGrade)) {
            $this->USRGrades->add($uSRGrade);
            $uSRGrade->setGRAUser($this);
        }

        return $this;
    }

    public function removeUSRGrade(Grade $uSRGrade): self
    {
        if ($this->USRGrades->removeElement($uSRGrade)) {
            // set the owning side to null (unless already changed)
            if ($uSRGrade->getGRAUser() === $this) {
                $uSRGrade->setGRAUser(null);
            }
        }

        return $this;
    }

    /**
     * @see PasswordAuthenticatedUserInterface
     */
    public function getPassword(): string
    {
        return $this->USRPassword;
    }

    public function getUserIdentifier(): string
    {
        return (string) $this->USREmail;
    }

    public function getToken(): ?string
    {
        return $this->token;
    }

    public function setToken(?string $Token): self
    {
        $this->token = $Token;

        return $this;
    }

    public function getRoles(): array
    {
        return ['ROLE_USER'];
    }

    public function eraseCredentials()
    {
    }
}
