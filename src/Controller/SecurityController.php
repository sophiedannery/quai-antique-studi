<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Bundle\SecurityBundle\Security;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;
use Symfony\Component\Security\Csrf\CsrfTokenManagerInterface;
use Symfony\Component\Security\Http\Authentication\AuthenticationUtils;

class SecurityController extends AbstractController
{
    #[Route(path: '/login', name: 'app_login')]
    public function login(
        AuthenticationUtils $authenticationUtils,
        Security $security,
        CsrfTokenManagerInterface $csrfTokenManager
        ): Response
    {
        // Si un utilisateur est déjà connecté
        if ($user = $security->getUser()) {
            // Si c’est admin, redirection vers l’espace admin
            if (in_array('ROLE_ADMIN', $user->getRoles(), true)) {
                return $this->redirectToRoute('app_admin');
            }
        // Sinon, redirection vers l’espace client
        return $this->redirectToRoute('app_profile');
        }

        // Récupérer la dernière erreur d'authentification
        $error = $authenticationUtils->getLastAuthenticationError();
        // Récupérer le dernier identifiant saisi
        $lastUsername = $authenticationUtils->getLastUsername();

        return $this->render('security/login.html.twig', [
            'last_username' => $lastUsername,
            'error' => $error
            ]);
    }

    // =========================
    // Déconnexion
    // =========================
    #[Route(path: '/logout', name: 'app_logout')]
    public function logout(): void
    {
        throw new \LogicException('This method can be blank - it will be intercepted by the logout key on your firewall.');
    }

    // =========================
    // Inscription API
    // =========================
    #[Route('/security/registration', name: 'app_registration')]
    public function register(): Response
    {
        return $this->render('security/registration.html.twig', [
        ]);
    }

    // =========================
    // Connexion API
    // =========================
    #[Route('/security/loginapi', name: 'app_loginapi')]
    public function loginapi(): Response
    {
        return $this->render('security/loginapi.html.twig', [
        ]);
    }
}
