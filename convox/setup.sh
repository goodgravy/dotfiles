#!/bin/bash
set -x
script_dir=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

if [ $(uname) = 'Darwin' ]; then
  binary="$script_dir/../bin/convox-macos"
else
  binary="$script_dir/../bin/convox-linux"
fi

ln -sf $binary $(dirname $binary)/convox
