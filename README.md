Getting started
===============

Clone this repository to your home directory.

.hgrc and .vimrc will be automatically included, on Windows and Unixes.

Add the following line to the top of your PowerShell profile (`vim $PROFILE`):

    Import-Module $HOME\base_profile.psm1 -DisableNameChecking

Add things you don't want committed (secrets, etc.) to your actual `$PROFILE`.

.gitignore contains simply `*` because I don't want to accidentally add files from my home directory.
