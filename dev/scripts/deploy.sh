#!/bin/bash

# -------------------------------------------------------------------
# Script Name: deploy.sh
# Description: Run this script to deploy to a production environment.
# Usage: ./deploy.sh
# Author: xor
# @todo: add more details, this script is incomplete
# -------------------------------------------------------------------

# set the working directory to the root of the project
cd ..


# Compile Assets
php bin/console asset-map:compile
# @todo: move assets to S3 bucket

#build the docker image
# docker build -t PROJECT:latest .

# push image to AWS ECR
# docker push PROJECT:latest

# deploy to ECS
#aws ecs update-service --cluster PROJECT --service PROJECT --force-new-deployment

#
