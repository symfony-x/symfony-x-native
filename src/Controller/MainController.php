<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class MainController extends BaseController
{
    #[Route('/', name: 'web_home')]
    public function home(): Response
    {
        return $this->render('default/complete.html.twig');
    }

}
