#!/usr/bin/env bash
set -eu

if [ ! -f ./registered]; then
# register if not
/no-conda-runner/config.sh --url https://github.com/hex-git/$REPO --token $GH_TOKEN
touch ./registered
fi
while true; do /no-conda-runner/run.sh; sleep 10; done
