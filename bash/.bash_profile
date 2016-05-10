# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
        . /etc/bashrc
        . ~/.bashrc
fi

# npm
export PATH="/usr/local/share/npm/bin:$PATH"
