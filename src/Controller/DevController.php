<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

class DevController extends BaseController
{
    #[Route('/_dev/default-html', name: 'dev_default_html')]
    public function devDefaultHtml(): Response
    {
        return $this->render('default/complete.html.twig');
    }

}
