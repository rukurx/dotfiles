# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# -------------------------------------
# zshのオプション
# -------------------------------------

## 色を使う
setopt prompt_subst

## 補完設定
# 強力な補完を有効にする
autoload -Uz compinit
compinit
# タブによるファイルの順番切り替えをしない
unsetopt auto_menu

## 履歴設定
# 保存先
HISTFILE=~/.zsh_history
# メモリに展開する件数
HISTSIZE=10000
# 保存する件数
SAVEHIST=10000
# 直前と同じコマンドを追加しない
setopt hist_ignore_dups


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
alias vgd='vagrant destroy'
alias vgr='vagrant reload'
