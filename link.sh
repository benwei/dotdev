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

showcopied() {
    expr="$1"
    tag="$2"
    if [ $expr -eq 0 ] ; then
        echo "$tag copied"
    else
        echo "$tag has been copied"
    fi
}


ln_dotrc () {
    target="$HOME/.$1"
    src="$DOTPATH/$1"

    if [ "$2" = "none" ]; then
        src="$DOTPATH" # special for vim
    elif [ -n "$2" ]; then
        src="$DOTPATH/$2"
    fi

    if [ ! -h "$target" ]; then
        ln -sf "$src" "$target"
        showlink 0 "$1"
    else
        showlink 1 "$1"
    fi
}

cp_dotrc () {
    target="$HOME/.$1"
    src="$DOTPATH/$1"

    if [ "$2" = "none" ]; then
        src="$DOTPATH" # special for vim
    elif [ -n "$2" ]; then
        src="$DOTPATH/$2"
    fi

    if [ ! -f "$target" ]; then
        cp -f "$src" "$target"
        showcopy 1 "$src"
    else
        echo "$target has been existed"
    fi
}

# vim
ln_dotrc 'vim' 'none'
cp_dotrc 'vimrc'

# tmux
ln_dotrc 'tmux'
cp_dotrc 'tmux.conf'

# oh-my-zsh
ln_dotrc 'oh-my-zsh' 'tools/oh-my-zsh'
cp_dotrc 'zshrc'

# snippetrc
cp_dotrc 'snippetrc'

sh tools/gitm/git-macro-setup
