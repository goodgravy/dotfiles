#!/bin/sh
set -eu
set -o pipefail

curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.11/install.sh | bash