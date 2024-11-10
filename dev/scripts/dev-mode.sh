#!/bin/bash


# @todo: move to makefile


# -------------------------------------------------------------------
# Script Name: dev-mode.sh
# Description: Run this script to start local dev services. Needed if not using symfony web server, which is what we're aiming for.
# Usage: ./dev-mode.sh
# Author: xor
# -------------------------------------------------------------------

# set the working directory to the root of the project
cd ..

# start docker compose
docker compose up -d

# run AssetMapper in watch mode
# @todo: add this command



# Tailwind build in watch mode
php bin/console tailwind:build -w
