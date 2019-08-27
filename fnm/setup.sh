#!/bin/bash
set -eux
set -o pipefail

curl -fsSL https://github.com/Schniz/fnm/raw/master/.ci/install.sh | bash -s -- --skip-shell
