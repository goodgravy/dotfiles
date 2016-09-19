# Dotfiles

These files are the configuration I use to personalise my computer and my
development environment.

I follow the conventions laid out by
[Full Stop](//github.com/goodgravy/full-stop) which means that running the
[`full-stop`](/full-stop/script/full-stop) script links files into the right
places, sets up my path, and runs the `setup.sh` scripts.

A good amount of this configuration was inspired by or taken directly from
[holman/dotfiles](//github.com/holman/dotfiles).

## To use

```sh
git clone git@github.com:goodgravy/dotfiles.git $HOME/.dotfiles
cd $HOME/.dotfiles
git submodule init
git submodule update --rebase
./full-stop/script/full-stop
```
