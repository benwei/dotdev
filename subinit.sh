#!/bin/sh
. ./settings.conf

cd ~/$DOTPATH
git submodule update --init --recursive
