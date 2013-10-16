#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

set -e
set -x

apt-get update -yq
apt-get install -yq git-all curl make

if ! which docker ; then
  curl -s https://test.docker.io | sh
fi
