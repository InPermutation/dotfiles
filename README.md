Getting started – Zsh
=====================
Clone this repository wherever you'd like. I picked `~/dotfiles`.

Run `git submodule update --init`  after checking it out to get the submodules.

Symlink `.vim`, `.vimrc`, `.zshrc` to the ones in here.

Also symlink `.gitconfig`, but if you have any overrides (e.g. GPG config), add the following to `~/.gitconfig` instead:

```
[include]
    path = ~/dotfiles/.gitconfig
```

Updating
========
Per [Git book 7.11: Git Tools - Submodules](https://git-scm.com/book/en/v2/Git-Tools-Submodules),

```
git submodule update --remote
```
