<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class ReservationController extends AbstractController
{
    #[Route('/mes-reservation', name: 'app_reservation')]
    public function mesReservations(): Response
    {
        return $this->render('reservation/mes-reservation.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }

    #[Route('/reserver', name: 'app_reserver')]
    public function reserver(): Response
    {
        return $this->render('reservation/reserver.html.twig', [
            'controller_name' => 'ReservationController',
        ]);
    }
}
