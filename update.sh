#!/bin/bash

# expected usage:
# ./update.sh --owner suculent

export TAG="alpine"
export OWNER="thinxcloud"

echo "Will update image with tag ${TAG}"

docker build -t $OWNER/base:alpine .

docker push $OWNER/base:alpine
