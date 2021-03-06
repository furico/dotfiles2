#!/bin/bash

#
# ホームディレクトリにシンボリックリンクを作成する
#

# ファイル
ln -sf $(pwd)/zshrc ${HOME}/.zshrc
ln -sf $(pwd)/vimrc ${HOME}/.vimrc
ln -sf $(pwd)/gvimrc ${HOME}/.gvimrc
ln -sf $(pwd)/tmux.conf ${HOME}/.tmux.conf
ln -sf $(pwd)/ctags ${HOME}/.ctags

# ディレクトリ
if [ ! -e ${HOME}/.vim ]; then
  ln -sf $(pwd)/vim ${HOME}/.vim
fi
if [ ! -e ${HOME}/settings ]; then
  ln -sf $(pwd)/settings ${HOME}/settings
fi
ln -sf $(pwd)/bin ${HOME}
