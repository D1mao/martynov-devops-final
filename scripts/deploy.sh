#!/usr/bin/env bash

set -euo pipefail

TAG=""

usage() {
  echo "Usage: ./scripts/deploy.sh -t <tag>"
  echo "Example: ./scripts/deploy.sh -t v1"
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

echo "Deploying FoodTracker with image tag: ${TAG}"

IMAGE_TAG="${TAG}" docker compose up -d

echo "Deployment completed"
echo "Application: http://localhost:8080"
echo "Grafana:     http://localhost:3000"
echo "Loki:        http://localhost:3100/ready"