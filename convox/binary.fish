if [ (uname) = 'Darwin' ]
  set binary (which convox-macos)
else
  set binary (which convox-linux)
end

ln -s $binary (dirname $binary)/convox
