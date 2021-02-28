#!/bin/bash

set -e

source "deploy/bin/variables/variables.sh"

RUNNING_TAG="staging"
IMAGE_NAME="bookstore/staging/web-server"

if [ -z $IMAGE_NAME ]; then
  echo "Need pass params"
  exit
fi

REPO="$ECR_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME"

HASH_TAG="$(git rev-parse --short HEAD)"

RUNNING_IMAGE=$REPO:$RUNNING_TAG
CURRENT_IMAGE=$IMAGE_NAME:$HASH_TAG

$(aws ecr get-login --region $REGION --no-include-email --profile custom)

docker build --cache-from=$RUNNING_IMAGE -t $CURRENT_IMAGE ./docker/nginx

docker tag $CURRENT_IMAGE $REPO:$HASH_TAG
docker tag $CURRENT_IMAGE $RUNNING_IMAGE

docker push $REPO:$HASH_TAG
docker push $RUNNING_IMAGE
