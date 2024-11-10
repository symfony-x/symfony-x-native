#!/bin/bash

# @todo: move to makefile

# -------------------------------------------------------------------
# Script Name: initial-setup.sh
# Description: Run once to set up the local dev environment.
# Usage: ./intial-setup.sh
# -------------------------------------------------------------------

# set the working directory to the root of the project
cd ..

# Tailwind initialization
docker exec -it symfony-x php bin/console tailwind:build --watch

docker exec -it php-1 php bin/console tailwind:init

# Migrations
php bin/console doctrine:migrations:migrate

# Load fixtures
php bin/console doctrine:fixtures:load

