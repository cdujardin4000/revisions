<?php

namespace App\Controller;

use App\Entity\Employee;
use App\Entity\Mission;
use App\Form\MissionType;
use App\Repository\EmployeeRepository;
use App\Repository\MissionRepository;
use Doctrine\Common\Collections\Criteria;
use Doctrine\DBAL\Exception;
use HttpResponseException;
use stdClass;
use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;
use Symfony\Component\Security\Csrf\CsrfToken;
use Symfony\Component\Security\Http\Attribute\IsGranted;

#[IsGranted('IS_AUTHENTICATED_FULLY')]
#[Route('/mission')]
class MissionController extends AbstractController
{

    #[Route('/{mission_id}/listAction', name: 'app_mission_listAction', methods: ['POST'])]
    public function action(Request $request, EmployeeRepository $employeeRepository, MissionRepository $missionRepository): Response|HttpResponseException
    {
        // get common data
        $action = $request->request->get('action');
        $submittedToken = $request->request->get('token');
        $user = $this->getUser()?->getId();

        //get usage data
        $mission_id = $request->request->get('mission_id');
        $emp_no = $request->request->get('emp_no');

        //generate the validationToken
        $validationToken = new csrfToken($user . 'mission-action' . $mission_id, $submittedToken);

        //check data
        $obj = new stdClass;
        $obj->emp_no = intVal($emp_no);
        $obj->user = $user;
        $obj->validationToken = $validationToken->getValue();
        $obj->submittedToken = $submittedToken;
        //dd($obj);
        //control data
        if (intVal($emp_no) !== $user || $validationToken->getValue() !== $submittedToken) {
            return new HttpResponseException();
        }

        //process
        $employee = $employeeRepository->find($emp_no);
        $mission = $missionRepository->find($mission_id);

        if ($mission && $action === 'terminate') {
            $mission->setStatus('done');
        }

        if ($employee && $mission && $action === 'accept') {
            $mission->setEmployee($employee);
            $mission->setStatus('ongoing');
        }

        $missionRepository->save($mission, true);

        return $this->redirectToRoute('app_mission_list', [], Response::HTTP_SEE_OTHER);
    }
    /**
     * @throws Exception
     */
    #[Route('/list', name: 'app_mission_list', methods: ['GET'])]
    public function list(MissionRepository $missionRepository): Response|HttpResponseException
    {
        if (!$this->getUser()?->getId())
        {
            return new HttpResponseException;
        }
        $missions = $missionRepository->findOwnandNotTerminated($this->getUser()?->getId());


        return $this->render('mission/list.html.twig', [
            'missions' => $missions
        ]);
    }

    #[Route('/new', name: 'app_mission_new', methods: ['GET', 'POST'])]
    public function new(Request $request, MissionRepository $missionRepository): Response
    {
        $mission = new Mission();
        $form = $this->createForm(MissionType::class, $mission);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $missionRepository->save($mission, true);

            return $this->redirectToRoute('app_mission_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('mission/new.html.twig', [
            'mission' => $mission,
            'form' => $form,
        ]);
    }

    #[Route('/{mission_id}', name: 'app_mission_show', methods: ['GET'])]
    public function show(Mission $mission): Response
    {
        return $this->render('mission/show.html.twig', [
            'mission' => $mission,
        ]);
    }

    #[Route('/{mission_id}/edit', name: 'app_mission_edit', methods: ['GET', 'POST'])]
    public function edit(Request $request, Mission $mission, MissionRepository $missionRepository): Response
    {
        $form = $this->createForm(MissionType::class, $mission);
        $form->handleRequest($request);

        if ($form->isSubmitted() && $form->isValid()) {
            $missionRepository->save($mission, true);

            return $this->redirectToRoute('app_mission_index', [], Response::HTTP_SEE_OTHER);
        }

        return $this->renderForm('mission/edit.html.twig', [
            'mission' => $mission,
            'form' => $form,
        ]);
    }

    #[Route('/{mission_id}', name: 'app_mission_delete', methods: ['POST'])]
    public function delete(Request $request, Mission $mission, MissionRepository $missionRepository): Response
    {
        if ($this->isCsrfTokenValid('delete' . $mission->getMission_id(), $request->request->get('_token'))) {
            $missionRepository->remove($mission, true);
        }

        return $this->redirectToRoute('app_mission_index', [], Response::HTTP_SEE_OTHER);
    }
}
