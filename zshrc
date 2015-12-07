echo "Loading ${HOME}/.zshrc ..."

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
$ "

# path の重複防止
typeset -U path
# (N-/)をつけるとディレクトリが存在しない場合はパスは追加されない
path=(
  ${HOME}/bin(N-/)
  $path
)

########################################
# 補完
# 補完機能を有効にする
autoload -Uz compinit
compinit

# 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

########################################
# vcs_info
autoload -Uz vcs_info
autoload -Uz add-zsh-hook

zstyle ':vcs_info:*' formats '%F{green}(%s)-[%b]%f'
zstyle ':vcs_info:*' actionformats '%F{red}(%s)-[%b|%a]%f'

function _update_vcs_info_msg() {
    LANG=en_US.UTF-8 vcs_info
    RPROMPT="${vcs_info_msg_0_}"
}
add-zsh-hook precmd _update_vcs_info_msg

########################################
# オプション

# 同時に起動したzshの間でヒストリを共有する
setopt share_history

# 同じコマンドをヒストリに残さない
setopt hist_ignore_all_dups

# スペースから始まるコマンド行はヒストリに残さない
setopt hist_ignore_space

# ヒストリに保存するときに余分なスペースを削除する
setopt hist_reduce_blanks


########################################
# キーバインド

# ^R で履歴検索をするときに * でワイルドカードを使用出来るようにする
bindkey '^R' history-incremental-pattern-search-backward

# 今の入力を元にコマンドライン履歴から補完する
autoload -Uz history-search-end
zle -N history-beginning-search-backward-end history-search-end
bindkey "^O" history-beginning-search-backward-end

########################################
# エイリアス

alias ll='ls -l'
alias la='ll -a'
alias sudo='sudo '

# 全てのコマンドライン履歴からgrep
alias ha='history -n 1 | grep'

# ctags
alias ct='ctags -R'

# グローバルエイリアス
alias -g L='| less'
alias -g G='| grep'

########################################
# OS 別の設定
case ${OSTYPE} in
    darwin*)
        # Mac用の設定
        export CLICOLOR=1
        alias ls='ls -G -F'
        if [[ -d /Applications/MacVim.app ]]; then # MacVimが存在するならば
            PATH="/Applications/MacVim.app/Contents/MacOS:$PATH"
            alias vim=/Applications/MacVim.app/Contents/MacOS/Vim
            alias gvim=/Applications/MacVim.app/Contents/MacOS/mvim
        fi
        ;;
    linux*)
        #Linux用の設定
        alias ls='ls -F --color=auto'
        export LS_COLORS='di=01;36:ln=01;35:so=01;32:ex=01;32:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
        ;;
esac

########################################
# ローカル用の設定を読み込む

ZSHRC_LOCAL="${HOME}/settings/zshrc_local"
if [ -e ${ZSHRC_LOCAL} ]; then
    echo "Loading ${ZSHRC_LOCAL} ..."
    source ${ZSHRC_LOCAL}
fi

# vim:set filetype=zsh :
