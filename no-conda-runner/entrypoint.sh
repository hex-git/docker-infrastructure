#!/usr/bin/env bash
set -eu

/no-conda-runner/config.sh --url https://github.com/hex-git/$REPO --token $GH_TOKEN
while true; do /no-conda-runner/run.sh; sleep 10; done
