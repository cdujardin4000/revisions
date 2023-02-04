<?php

namespace App\Entity;

use App\Repository\DepartmentRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;


#[ORM\Table(name: 'departments')]
#[ORM\Entity(repositoryClass: DepartmentRepository::class)]
class Department
{

    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column(length: 10)]
    private ?string $dept_no = null;

    #[ORM\Column(length: 25)]
    private ?string $dept_name = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $description = null;

    #[ORM\Column(length: 150, nullable: true)]
    private ?string $address = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $roi_url = null;

    #[ORM\ManyToMany(targetEntity: Employee::class, mappedBy: 'departments')]
    #[ORM\JoinTable(name: 'dept_emp')]
    #[ORM\JoinColumn(name: 'dept_no', referencedColumnName: 'dept_no')]
    #[ORM\InverseJoinColumn(name: 'emp_no', referencedColumnName: 'emp_no')]
    private Collection $employees;

    #[ORM\OneToMany(mappedBy: 'department', targetEntity: Intern::class)]
    private Collection $interns;

    public function __construct()
    {
        $this->employees = new ArrayCollection();
        $this->interns = new ArrayCollection();
    }

    public function __toString(): string
    {
        return $this->dept_name;
    }

    public function getDeptNo(): ?string
    {
        return $this->dept_no;
    }

    public function setDeptNo(string $dept_no): self
    {
        $this->dept_no = $dept_no;

        return $this;
    }

    public function getDeptName(): ?string
    {
        return $this->dept_name;
    }

    public function setDeptName(string $dept_name): self
    {
        $this->dept_name = $dept_name;

        return $this;
    }

    public function getDescription(): ?string
    {
        return $this->description;
    }

    public function setDescription(?string $description): self
    {
        $this->description = $description;

        return $this;
    }

    public function getAddress(): ?string
    {
        return $this->address;
    }

    public function setAddress(?string $address): self
    {
        $this->address = $address;

        return $this;
    }

    public function getRoiUrl(): ?string
    {
        return $this->roi_url;
    }

    public function setRoiUrl(?string $roi_url): self
    {
        $this->roi_url = $roi_url;

        return $this;
    }

    /**
     * @return Collection<int, Employee>
     */
    public function getEmployees(): Collection
    {
        return $this->employees;
    }

    public function addEmployee(Employee $employee): self
    {
        if (!$this->employees->contains($employee)) {
            $this->employees->add($employee);
            $employee->setDepartment($this);
        }

        return $this;
    }

    public function removeEmployee(Employee $employee): self
    {
        if ($this->employees->removeElement($employee)) {
            // set the owning side to null (unless already changed)
            if ($employee->getDepartment() === $this) {
                $employee->setDepartment(null);
            }
        }

        return $this;
    }

    /**
     * @return Collection<int, Intern>
     */
    public function getInterns(): Collection
    {
        return $this->interns;
    }

    public function addIntern(Intern $intern): self
    {
        if (!$this->interns->contains($intern)) {
            $this->interns->add($intern);
            $intern->setDepartment($this);
        }

        return $this;
    }

    public function removeIntern(Intern $intern): self
    {
        if ($this->interns->removeElement($intern)) {
            // set the owning side to null (unless already changed)
            if ($intern->getDepartment() === $this) {
                $intern->setDepartment(null);
            }
        }

        return $this;
    }
}
