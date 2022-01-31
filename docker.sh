#!/usr/bin/env bash
set -eou pipefail

DOCKER_IMAGE_NAME="aws-cli-python"

function build() {
  local PYTHON_VERSION=${1:-"3.9.10"}
  docker build --tag "$DOCKER_IMAGE_NAME:$PYTHON_VERSION" . --build-arg PYTHON_VERSION="$PYTHON_VERSION"
}

function run() {
  local PYTHON_VERSION=${1:-"3.9.10"}
  docker run -it "$DOCKER_IMAGE_NAME:$PYTHON_VERSION"
}

"$@"
