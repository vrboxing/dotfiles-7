#!/bin/bash
# -*- coding: utf-8 -*-
#
# This script is to syncronize "~/.emacs" and essentials of "~/.emacs.d/"
# from the repository on github.com.

# Copyright [2017] <oracleyue>


# essential bash settings
sync='/usr/bin/rsync -rlptD -P --delete --exclude=.DS_Store'
repopath=$HOME'/Workspace/gitrepo/dotfiles'

# push updates to github.com
cd $repopath && git pull && cd ~

# rsync .emacs or init.el
$sync $repopath/_emacs.d/init.el ~/.emacs.d/init.el
# sed 's/Sans Mono-[0-9][0-9]/Sans Mono-15/' \
#     $repopath/_emacs.d/init.el > ~/.emacs.d/init.el

# rsync .emacs.d (essential packages)
$sync $repopath/_emacs.d/init ~/.emacs.d/
$sync --exclude="clang-complete" --exclude="*.pyc" \
      $repopath/_emacs.d/git ~/.emacs.d/
$sync $repopath/_emacs.d/themes ~/.emacs.d/
$sync $repopath/_emacs.d/snippets ~/.emacs.d/
$sync $repopath/_emacs.d/templates ~/.emacs.d/