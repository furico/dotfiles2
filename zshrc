echo 'Loading .zshrc...'

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# emacs 風キーバインドにする
bindkey -e

# ヒストリの設定
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# プロンプト
PROMPT="%{${fg[green]}%}[%n@%m]%{${reset_color}%} %~
%# "

########################################
# エイリアス
alias ll='ls -l'
alias la='ls -al'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

# vim:set filetype=zsh :
