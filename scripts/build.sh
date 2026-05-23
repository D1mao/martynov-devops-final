#!/usr/bin/env bash

set -euo pipefail

IMAGE_NAME="foodtracker"
TAG=""

usage() {
  echo "Usage: ./scripts/build.sh -t <tag>"
  echo "Example: ./scripts/build.sh -t v1"
}

while getopts ":t:h" opt; do
  case "$opt" in
    t)
      TAG="$OPTARG"
      ;;
    h)
      usage
      exit 0
      ;;
    \?)
      echo "Unknown option: -$OPTARG"
      usage
      exit 1
      ;;
    :)
      echo "Option -$OPTARG requires an argument"
      usage
      exit 1
      ;;
  esac
done

if [[ -z "$TAG" ]]; then
  echo "ERROR: tag is required"
  usage
  exit 1
fi

echo "Building image ${IMAGE_NAME}:${TAG}"
docker build -t "${IMAGE_NAME}:${TAG}" .
echo "Image ${IMAGE_NAME}:${TAG} built successfully"