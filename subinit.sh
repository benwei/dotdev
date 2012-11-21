#!/bin/sh
. ./settings.conf

cd ~/$DOTPATH
git submodule init
git submodule update
