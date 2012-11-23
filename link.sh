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

if [ ! -h ~/.tmux.conf ] ; then
ln -sf ~/$DOTPATH/tmux.conf ~/.tmux.conf
showlink 0 "tmux conf"
else
showlink 1 "tmux conf"
fi

if [ ! -h ~/.tmux ]; then
ln -sf ~/$DOTPATH/tmux ~/.tmux
showlink 0 "tmux"
else
showlink 1 "tmux"
fi

if [ ! -h ~/.vimrc ]; then
ln -sf ~/$DOTPATH/vimrc ~/.vimrc
showlink 0 "vimrc"
else
showlink 1 "vimrc"
fi

if [ ! -h ~/.vim ]; then
ln -sf ~/$DOTPATH/ ~/.vim
showlink 0 "vim"
else
showlink 1 "vim"
fi

