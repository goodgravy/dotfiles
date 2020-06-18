#!/bin/bash
set -x

if [ $(uname) = 'Darwin' ]; then
  binary=$(which convox-macos)
else
  binary=$(which convox-linux)
fi

ln -sf $binary $(dirname $binary)/convox
