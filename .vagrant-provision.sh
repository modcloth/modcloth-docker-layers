#!/bin/bash

export DEBIAN_FRONTEND=noninteractive

set -e
set -x

apt-get update -yq
apt-get install -yq git-all curl make
curl -sL https://get.docker.io/ | sh
usermod -a -G docker vagrant
