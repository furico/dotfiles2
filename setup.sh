#!/bin/bash

ln -sf $(pwd)/zshrc ${HOME}/.zshrc
ln -sf $(pwd)/vimrc ${HOME}/.vimrc
ln -sf $(pwd)/gvimrc ${HOME}/.gvimrc
ln -sf $(pwd)/tmux.conf ${HOME}/.tmux.conf
if [ ! -e ${HOME}/.vim ]; then
  ln -sf $(pwd)/vim ${HOME}/.vim
fi
if [ ! -e ${HOME}/.localsettings ]; then
  ln -sf $(pwd)/localsettings ${HOME}/.localsettings
fi
if [ -e ${HOME}/Dropbox/riv_vim ]; then
  ln -sf ${HOME}/Dropbox/riv_vim ${HOME}
fi
