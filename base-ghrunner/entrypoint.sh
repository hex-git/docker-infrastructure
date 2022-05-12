#!/usr/bin/env bash
set -eu

source $CONDA/bin/activate
/base-runner/config.sh --url https://github.com/hex-git/$REPO --token $GH_TOKEN
while true; do /base-runner/run.sh; sleep 10; done
