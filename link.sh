#!/bin/sh

. ./settings.conf

# showlink(expr, tag) 
showlink() {
    expr="$1"
    tag="$2"
    if [ $expr -eq 0 ] ; then
        echo "$tag linked"
    else
        echo "$tag has been linked"
    fi
}


dotrc () {
    target="$HOME/.$1"
    src="$HOME/$DOTPATH/$1"

    if [ -n "$2" ]; then
        src="$HOME/$DOTPATH/$2"
    fi

    if [ ! -h "$target" ]; then
        ln -sf "$src" "$target"
        showlink 0 "$1"
    else
        showlink 1 "$1"
    fi
}

# vim
dotrc 'vim'
dotrc 'vimrc'

# tmux
dotrc 'tmux'
dotrc 'tmux.conf'

# oh-my-zsh
dotrc 'oh-my-zsh' 'tools/oh-my-zsh'
dotrc 'zshrc'

# snippetrc
dotrc 'snippetrc'
