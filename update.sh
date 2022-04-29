#!/bin/bash

# expected usage:
# ./update.sh --owner suculent

export TAG=1.$(git rev-list head --count)

export OWNER="thinxcloud"

echo "Will update image with current commit count tag ${TAG}"

docker build -t $OWNER/base:$TAG .

docker push $OWNER/base:alpine
