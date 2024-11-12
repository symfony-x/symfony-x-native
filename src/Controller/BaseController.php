<?php

namespace App\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;

class BaseController extends AbstractController
{
    // in the name of extensibility, we can add common methods here
    // that we want to be available in all controllers.
    // i see this as being used in forked projects for customizations.
    // pretty sure there are no performance implications in production runtime.
    // this is why we spent all that time learning OOP, right?

}
