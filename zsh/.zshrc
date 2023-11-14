# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# -------------------------------------
# 環境変数
# -------------------------------------

# 標準エディタの指定
export EDITOR=vim

# SSHで接続した先で日本語が使えるようにする
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# -------------------------------------
# zshのオプション
# -------------------------------------

## 色を使う
setopt prompt_subst

## 補完設定
# 補完を有効にする
autoload -Uz compinit && compinit
# タブによるファイルの順番切り替えする
setopt auto_menu
# Shift+Tabで補完を戻る
bindkey "^[[Z" reverse-menu-complete
# 補完候補をハイライトする
zstyle ':completion:*:default' menu select=1
# 大文字小文字を区別しない（大文字を入力した場合は区別する）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
# ../ の補完で、今いるディレクトリを表示しない
zstyle ':completion:*' ignore-parents parent pwd ..
# ディレクトリ名だけで cd する
setopt auto_cd
# auto_pushdで重複するディレクトリは記録しない
setopt pushd_ignore_dups
# 補完候補がないときなどにビープ音を鳴らさない。
setopt no_beep
# 補完候補をキャッシュする。
zstyle ':completion:*' use-cache yes
# キャッシュ保存先
zstyle ':completion:*' cache-path ~/.zsh/cache


## 履歴設定
# 保存先
HISTFILE=~/.zsh_history
# メモリに展開する件数
HISTSIZE=10000
# 保存する件数
SAVEHIST=10000
# 直前と同じコマンドを追加しない
# setopt hist_ignore_dups
# 過去に同じコマンドがあれば古い履歴を削除する
setopt hist_ignore_all_dups
# 履歴にhistoryコマンドを記録しない
setopt hist_no_store
# 余分な空白を削除して履歴に記録する
setopt hist_reduce_blanks
# zshプロセスで履歴を共有する
setopt share_history


# 区切り文字の指定
autoload -Uz select-word-style
select-word-style default 
zstyle ':zle:*' word-chars ' /=;@:{}[]()<>,|.'
zstyle ':zle:*' word-style unspecified


# コマンドライン上で、「#」以降がコメントになる(履歴のラベルに使える)
setopt interactive_comments

# 日本語ファイル名を表示可能にする
setopt print_eight_bit

# Ctrl+s での画面ロックと Ctrl+q での解除を無効化する
setopt no_flow_control

# -------------------------------------
# キーバインド
# -------------------------------------

## コマンドラインの操作はEmacsモードで行う(bindkeyで一覧表示される)
# Ctrl + a : 行頭に移動
# Ctrl + e : 行末に移動
# Ctrl + f : 進む
# Ctrl + b : 戻る
# Ctrl + d : 後方の1文字削除
# Ctrl + h : 前方の1文字削除
# Ctrl + k : カーソル位置から行末まで削除
# Ctrl + u : カーソル位置から行頭まで削除
# Ctrl + w : カーソル位置から行頭に向かって単語(区切り文字)単位で削除
# Ctrl + / : 元へ戻す(undo)
bindkey -e


# -------------------------------------
# プロンプト
# -------------------------------------
autoload -U promptinit; promptinit
autoload -Uz colors; colors
autoload -Uz vcs_info

local branch_format="%F{red}(%b%u%c)%f"
local action_format="%F{red}(%b|%a)%f"
local unstaged_format=" *"
local staged_format=" +"

zstyle ":vcs_info:git:*" check-for-changes true
zstyle ":vcs_info:git:*" stagedstr "${staged_format}"
zstyle ":vcs_info:git:*" unstagedstr "${unstaged_format}"
zstyle ":vcs_info:git:*" actionformats "${action_format}"
zstyle ":vcs_info:git:*" formats "${branch_format}"

function vcs_prompt_info() {
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && echo -n " %{$fg[red]%}$vcs_info_msg_0_%f"
}

#PROMPT="%F{green}%n@%m%f:"
PROMPT="%F{green}Mac%f:"
PROMPT+="%F{blue}%c%f"
PROMPT+="\$(vcs_prompt_info)"
PROMPT+="$ "

RPROMPT=""

# -------------------------------------
# エイリアス
# -------------------------------------
alias -- -='cd -'
alias ..='cd ..'
alias sbp='source ~/.bash_profile'
alias du='du -h'
alias df='df -h' # 単位付きで表示
alias grep='grep --color' # 検索対象文字をハイライト
alias ll='ls -Glah'
alias ls='ls -G'
alias mkdir='mkdir -p' # 再帰的にディレクトリを作成
alias cp='cp -ip'
alias mv='mv -i'
alias rm='rm -i'
alias ps='ps --sort=start_time' # 時系列に表示
alias sudo='sudo '
alias sed='gsed' # GNU版のsed(gnu-sed)を使う

## グローバルエイリアス
alias -g G='| grep'

## zsh
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'

## vim
alias v="vim"
alias vv="vim ~/.vimrc"

## gitconfig
alias vgit="vim ~/.gitconfig"

## Vagrant
alias vgv='vagrant version' # バージョン情報
alias vgu='vagrant up'      # 起動
alias vgh='vagrant halt'    # シャットダウン
alias vgs='vagrant ssh'     # 接続する
alias vgst='vagrant status' # 状態確認
alias vgd='vagrant destroy' # 破棄する
alias vgr='vagrant reload'  # 再起動

# -------------------------------------
# pecoの設定
# -------------------------------------

# 履歴選択
function peco-select-history() {
    local tac
    if which tac > /dev/null; then
        tac="tac"
    else
        tac="tail -r"
    fi
    BUFFER=$(\history -n 1 | \
        eval $tac | \
        peco --query "$LBUFFER")
    CURSOR=$#BUFFER
    zle clear-screen
}
zle -N peco-select-history
bindkey '^r' peco-select-history

# -------------------------------------
# Rubyの設定
# -------------------------------------
# rbenvのパスを通す
#export PATH="$HOME/.rbenv/shims:$PATH"

# -------------------------------------
# PHPの設定
# -------------------------------------
# composerのパスを通す
# PATH=$PATH:~/local/bin:~/.composer/vendor/bin

[[ -s "$HOME/.avn/bin/avn.sh" ]] && source "$HOME/.avn/bin/avn.sh" # load avn

# -------------------------------------
# Pythonの設定
# -------------------------------------
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Pythonの仮想環境(.venvディレクトリ)をプロジェクトルート直下に作る
export PIPENV_VENV_IN_PROJECT=true
# 環境変数を列挙した.envファイルを読込する
export DJANGO_READ_DOT_ENV_FILE=true


# 特定のディレクトリのみで有効な環境変数や設定を使う
eval "$(direnv hook zsh)"

# -------------------------------------
# Goの設定
# -------------------------------------
export GOPATH=$HOME/go
export PATH=$GOPATH/bin:$PATH


# -------------------------------------
# Nodeの設定
# -------------------------------------
export PATH=$PATH:./node_modules/.bin
