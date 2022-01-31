#!/usr/bin/env bash
set -eou pipefail

function build() {
  local PYTHON_VERSION=${1:-"3.9.10"}
  docker build -t "awscli-python-$PYTHON_VERSION" . --build-arg PYTHON_VERSION="$PYTHON_VERSION"
}

function run() {
  local PYTHON_VERSION=${1:-"3.9.10"}
  docker run -it "awscli-python-$PYTHON_VERSION"
}

"$@"
