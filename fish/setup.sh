#!/bin/bash
set -x

command -v fish | sudo tee -a /etc/shells
chsh -s $(command -v fish)
