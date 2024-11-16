<?php

namespace App\Controller;

use Symfony\Component\HttpFoundation\JsonResponse;
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

    /**
     * Shows the current HTML of the desired template, so you can view it as you work on it.
     * @todo tool - AI integration with OpenAI or Gemini Canvas to generate HTML for a template.
     *
     * This method renders the 'complete.html.twig' template located in the 'symfony-x' directory.
     * It is accessible via the '/Symfony-X/_dev/default-html' URL and is named 'dev_default_html' for
     * routing purposes.
     *
     * @Route('/Symfony-X/_dev/default-html', name: 'dev_default_html')
     *
     * @return Response The HTTP response containing the rendered default HTML page.
     */
    #[Route('/Symfony-X/_dev/default-html', name: 'dev_default_html')]
    public function devDefaultHtml(): Response
    {
        return new JsonResponse([
            'message' => 'Use this route to view the current HTML of the template you are working on.',
        ]);
        //return $this->render('symfony-x/complete.html.twig');
    }

    #[Route('/Symfony-X/_dev/default-html', name: 'dev_default_html2')]
    public function devDefaultHtml2(): Response
    {
        return $this->render('symfony-x/dev/wip.html.twig');
    }


}
