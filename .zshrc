if type brew &>/dev/null
then
    FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

    autoload -Uz compinit
    compinit
fi

setopt interactive_comments
setopt no_nomatch
setopt no_bang_hist
