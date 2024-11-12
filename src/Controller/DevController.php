<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Attribute\Route;

/**
 * Summary of DevController
 *
 * For development purposes only! Must be removed in production, maybe sooner
 *
 * @author xor
 * @package App\Controller
 */
class DevController extends BaseController
{
    #[Route('/_dev/default-html', name: 'dev_default_html')]
    public function devDefaultHtml(): Response
    {
        return $this->render('symfony-x/complete.html.twig');
    }

}
