#!/bin/bash
set -eu
set -o pipefail

script_dir="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

if ! [ -f "$script_dir/gitconfig.local.symlink" ]
then
  echo 'setting up gitconfig.local'

  git_credential='cache'
  if [ "$(uname -s)" == "Darwin" ]
  then
    git_credential='osxkeychain'
  fi

  echo ' - What is your github author name?'
  read -e git_authorname
  echo ' - What is your github author email?'
  read -e git_authoremail

  sed -e "s/AUTHORNAME/$git_authorname/g" \
      -e "s/AUTHOREMAIL/$git_authoremail/g" \
      -e "s/GIT_CREDENTIAL_HELPER/$git_credential/g" \
      "$script_dir/gitconfig.local.symlink.template"  \
      > "$script_dir/gitconfig.local.symlink"

  echo "created $script_dir/gitconfig.local.symlink"
fi
