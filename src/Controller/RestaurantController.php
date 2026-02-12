<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

final class RestaurantController extends AbstractController
{
    #[Route('/restaurant/new', name: 'app_restaurant_new')]
    public function new(): Response
    {
        return $this->render('restaurant/new.html.twig', [
        ]);
    }
}
