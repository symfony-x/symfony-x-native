<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class MainController extends BaseController
{
    #[Route('/', name: 'app_home')]
    public function index(): Response
    {
        // Redirect to the Symfony-X welcome page by default
        // Change this to redirect to your own routes
        return $this->redirectToRoute('symfony-x_welcome');
    }

}
