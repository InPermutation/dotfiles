Getting started – Zsh
=====================
Clone this repository wherever you'd like. I picked `~/dotfiles`.

Run `git submodule update --init`  after checking it out to get the submodules.

Symlink `.vim` and `.vimrc` to the ones in here.

*You can also symlink `.hgrc` but it's probably suffered some bitrot; I haven't used Mercurial since 2018.*

Getting started – PowerShell
=============================

**May have bit-rotted; I haven't used PowerShell since 2018**

Clone this repository to the home directory.

Run `git submodule update --init`  after checking it out to get the submodules.

`.hgrc` and `.vimrc` will be automatically included, because we cloned it to the home directory.

Add the following line to the top of your PowerShell profile (`vim $PROFILE`):

    Import-Module $HOME\base_profile.psm1 -DisableNameChecking

Add things you don't want committed (secrets, etc.) to your actual `$PROFILE`.

`.gitignore` contains simply `*` because I don't want to accidentally add files from my home directory.

Updating
========
Per [How to update submodules in GIT](https://stackoverflow.com/a/33714623), 

```
git submodule foreach git pull
```
