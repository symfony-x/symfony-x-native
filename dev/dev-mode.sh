#!/bin/bash

# -------------------------------------------------------------------
# Script Name: dev-mode.sh
# Description: Run to start local services when developing.
# Usage: ./dev-mode.sh
# -------------------------------------------------------------------

# Tailwind build in watch mode
php bin/console tailwind:build -w
