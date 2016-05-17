export PATH=$HOME/.nodebrew/current/bin:$PATH
export PATH="/usr/local/share/npm/bin:$PATH"

source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

GIT_PS1_SHOWDIRTYSTATE=true
#export PS1='\h\[\033[00m\]:\W\[\033[31m\]$(__git_ps1 [%s])\[\033[00m\]\$ '
#export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\W\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '

# エイリアス
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

# Vagrant
alias vgu='vagrant up'
alias vgs='vagrant ssh'
alias vgd='vagrant destroy'
alias vgr='vagrant reload'
