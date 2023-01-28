<?php

namespace App\Entity;

use App\Repository\CarRepository;
use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Doctrine\ORM\Mapping as ORM;
use Doctrine\ORM\Mapping\Entity;

#[ORM\Table(name: 'cars')]
#[ORM\Entity(repositoryClass: CarRepository::class)]
class Car
{
    #[ORM\Id]
    #[ORM\GeneratedValue]
    #[ORM\Column]
    private ?int $car_id = null;

    #[ORM\Column(length: 10)]
    private ?string $registration_number = null;

    #[ORM\Column(length: 50)]
    private ?string $model = null;

    #[ORM\Column(length: 255, nullable: true)]
    private ?string $img_url = null;

    #[ORM\ManyToMany(targetEntity: Employee::class, inversedBy: 'car',)]
    #[ORM\JoinTable(name: 'cars_emp')]
    #[ORM\JoinColumn(name: 'id', referencedColumnName: 'emp_no')]
    #[ORM\InverseJoinColumn(name: 'car_id', referencedColumnName: 'car_id')]
    private collection $employee;



    public function getCarId(): ?int
    {
        return $this->car_id;
    }

    public function setCarId(int $car_id): self
    {
        $this->car_id = $car_id;

        return $this;
    }

    public function getRegistrationNumber(): ?string
    {
        return $this->registration_number;
    }

    public function setRegistrationNumber(string $registration_number): self
    {
        $this->registration_number = $registration_number;

        return $this;
    }

    public function getModel(): ?string
    {
        return $this->model;
    }

    public function setModel(string $model): self
    {
        $this->model = $model;

        return $this;
    }

    public function getImgUrl(): ?string
    {
        return $this->img_url;
    }

    public function setImgUrl(?string $img_url): self
    {
        $this->img_url = $img_url;

        return $this;
    }

    /**
     * @return Entity
     */
    public function getEmployee(): Employee
    {
        return $this->employee;
    }

    /**
     * @return Car
     */
    public function setEmployee($employee): Car
    {
        $this->employee = $employee;
        return $this;
    }


}
