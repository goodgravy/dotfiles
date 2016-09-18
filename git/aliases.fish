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
