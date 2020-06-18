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

echo 'Setting up git alias functions'
function glog
  git log \
    --graph --abbrev-commit --date=relative \
    --pretty=format:'%Cred%h%Creset %an: %s - %Creset %C(yellow)%d%Creset %Cgreen(%cr)%Creset' \
    $argv
end

function gp
  git push origin HEAD $argv
end

function gd
  git diff $argv
end

function gc
  git commit $argv
end

function gco
  git checkout $argv
end

function gs
  git status -sb $argv
end

function gap
  git add --patch $argv
end

function gcp
  git checkout --patch $argv
end
