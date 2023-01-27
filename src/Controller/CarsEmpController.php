<?php

namespace App\Controller;

use App\Entity\CarsEmp;
use App\Form\CarsEmpType;
use App\Repository\CarsEmpRepository;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

#[Route('/cars/emp')]
class CarsEmpController extends AbstractController
{
    #[Route('/', name: 'app_cars_emp_index', methods: ['GET'])]
    public function index(CarsEmpRepository $carsEmpRepository): Response
    {
        return $this->render('cars_emp/index.html.twig', [
            'cars_emps' => $carsEmpRepository->findAll(),
        ]);
    }

    #[Route('/new', name: 'app_cars_emp_new', methods: ['GET', 'POST'])]
    public function new(Request $request, CarsEmpRepository $carsEmpRepository): Response
    {
        $carsEmp = new CarsEmp();
        $form = $this->createForm(CarsEmpType::class, $carsEmp);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $carsEmpRepository->save($carsEmp, true);

            return $this->redirectToRoute('app_cars_emp_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('cars_emp/new.html.twig', [
            'cars_emp' => $carsEmp,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_cars_emp_show', methods: ['GET'])]
    public function show(CarsEmp $carsEmp): Response
    {
        return $this->render('cars_emp/show.html.twig', [
            'cars_emp' => $carsEmp,
        ]);
    }

    #[Route('/{id}/edit', name: 'app_cars_emp_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, CarsEmp $carsEmp, CarsEmpRepository $carsEmpRepository): Response
    {
        $form = $this->createForm(CarsEmpType::class, $carsEmp);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $carsEmpRepository->save($carsEmp, true);

            return $this->redirectToRoute('app_cars_emp_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('cars_emp/edit.html.twig', [
            'cars_emp' => $carsEmp,
            'form' => $form,
        ]);
    }

    #[Route('/{id}', name: 'app_cars_emp_delete', methods: ['POST'])]
    public function delete(Request $request, CarsEmp $carsEmp, CarsEmpRepository $carsEmpRepository): Response
    {
        if ($this->isCsrfTokenValid('delete'.$carsEmp->getId(), $request->request->get('_token'))) {
            $carsEmpRepository->remove($carsEmp, true);
        }

        return $this->redirectToRoute('app_cars_emp_index', [], Response::HTTP_SEE_OTHER);
    }
}
