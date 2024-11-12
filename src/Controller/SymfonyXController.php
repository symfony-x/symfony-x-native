<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

/**
 * SymfonyXController handles actions related to the Symfony-X module.
 *
 * This controller provides functionalities to display welcome pages and other related views
 * for the Symfony-X section of the application.
 *
 * @package App\Controller
 */
class SymfonyXController extends BaseController
{
     /**
     * Displays the welcome page for Symfony-X.
     *
     * This method renders the 'welcome.html.twig' template located in the 'symfony-x' directory.
     * It is accessible via the '/Symfony-X/Welcome' URL and is named 'symfony-x_welcome' for
     * routing purposes.
     *
     * @Route("/Symfony-X/Welcome", name="symfony-x_welcome")
     *
     * @return Response The HTTP response containing the rendered welcome page.
     */
    #[Route('/Symfony-X/Welcome', name: 'symfony-x_welcome')]
    public function welcome(): Response
    {
        return $this->render('symfony-x/welcome.html.twig');
    }

}
