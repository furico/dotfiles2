echo 'Loading .zshrc...'

########################################
# 環境変数
export LANG=ja_JP.UTF-8

# 色を使用出来るようにする
autoload -Uz colors
colors

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
# オプション

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

########################################
# エイリアス
alias ls='ls --color'
alias ll='ls -l'
alias la='ll -a'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

########################################
# 補完

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        # Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
	;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        ;;
esac

# vim:set filetype=zsh :
