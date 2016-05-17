# Source Prezto.
#if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
#  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
#fi

# -------------------------------------
# zshのオプション
# -------------------------------------

## 色を使う
setopt prompt_subst


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
