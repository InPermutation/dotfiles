Getting started – Zsh
=====================
Clone this repository wherever you'd like. I picked `~/dotfiles`.

Run `git submodule update --init`  after checking it out to get the submodules.

Symlink `.vim` and `.vimrc` to the ones in here.

Updating
========
Per [How to update submodules in GIT](https://stackoverflow.com/a/33714623), 

```
git submodule foreach git pull
```
