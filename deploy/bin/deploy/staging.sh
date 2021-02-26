#!/bin/bash

source "deploy/bin/variables/variables.sh"
source "deploy/bin/variables/staging.sh"
source "deploy/bin/deploy/base.sh"

deploy \
  --region "$REGION" \
  --aws-access-key "$AWS_ACCESS_KEY_ID" \
  --aws-secret-key "$AWS_SECRET_ACCESS_KEY" \
  --image-name "$IMAGE_NAME" \
  --repo "$ECR_ID.dkr.ecr.$REGION.amazonaws.com/$IMAGE_NAME" \
  --cluster "$CLUSTER" \
  --service "$SERVICE" \
  --environment "staging"
  