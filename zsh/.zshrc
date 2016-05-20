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
# 補完の定義ファイルを有効にする
autoload -Uz compinit
compinit
# タブによるファイルの順番切り替えをしない
unsetopt auto_menu
# 大文字小文字を区別しない（大文字を入力した場合は区別する）
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
# cd -<tab>で以前移動したディレクトリを表示
setopt auto_pushd
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
setopt hist_ignore_dups
# 履歴にhistoryコマンドを記録しない
setopt hist_no_store
# 余分な空白を削除して履歴に記録する
setopt hist_reduce_blanks
# zshプロセスで履歴を共有する
setopt share_history


# コマンドライン上で、「#」以降がコメントになる(履歴のラベルに使える)
setopt interactive_comments


# -------------------------------------
# キーバインド
# -------------------------------------

## コマンドラインの操作はEmacsスタイルで行う(bindkeyで一覧表示される)
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

## 使わないキーを無効にする(誤操作防止用)
bindkey -r '^J' # Ctrl + j : 実行
bindkey -r '^M' # Ctrl + m : 実行


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

PROMPT="%F{green}%n@%m%f:"
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

## グローバルエイリアス
alias -g G='| grep'

## zsh
alias sz='source ~/.zshrc'
alias vz='vim ~/.zshrc'

## Vagrant
alias vgu='vagrant up'
alias vgs='vagrant ssh'
alias vgst='vagrant status'
alias vgd='vagrant destroy'
alias vgr='vagrant reload'
