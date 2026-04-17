# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi


# Source git-prompt
if [ -f /usr/share/git/completion/git-prompt.sh ]; then
    source /usr/share/git/completion/git-prompt.sh
fi

# Configure git-prompt options
export GIT_PS1_SHOWDIRTYSTATE=1
export GIT_PS1_SHOWSTASHSTATE=1
export GIT_PS1_SHOWUNTRACKEDFILES=1
export GIT_PS1_SHOWUPSTREAM="auto"
export GIT_PS1_SHOWCOLORHINTS=1

if [ "$USER" = "root" ]; then
    PROMPT_COLOR=35
else
    PROMPT_COLOR=32
fi
PROMPT_DIR_COLOR=34
PROMPT_USERHOST='\u@\h'
PROMPT_SEPARATOR=':'
PROMPT_DIRECTORY='\w'
PROMPT_START=''
PROMPT_END=''
PROMPT_GIT_COLOR=33

PS1='\e[0m\]\e[${PROMPT_COLOR}m\]${PROMPT_USERHOST@P}\e[0m\]${PROMPT_SEPARATOR}\e[${PROMPT_DIR_COLOR}m\]${PROMPT_DIRECTORY@P}\e[0m\]$(__git_ps1 " (%s)")\e[0m\]$ '

# User specific environment
if ! [[ "$PATH" =~ "$HOME/.local/bin:$HOME/bin:" ]]; then
    PATH="$HOME/.local/bin:$HOME/bin:$PATH"
fi
export PATH=$PATH:~/.cargo/bin

# Uncomment the following line if you don't like systemctl's auto-paging feature:
# export SYSTEMD_PAGER=

# User specific aliases and functions
if [ -d ~/.bashrc.d ]; then
    for rc in ~/.bashrc.d/*; do
        if [ -f "$rc" ]; then
            . "$rc"
        fi
    done
fi
unset rc

export EDITOR=vim

alias ls="ls --color=auto"
alias l="ls -A"
alias ll="ls -lAh"
alias py="python"
alias df="df -h"
alias n="nvim -O"
alias rgrep="grep -R . -ne"
alias venv="source bin/activate"
alias ff='fastfetch'
alias battery="upower -b"

# C/C++ build
alias cbuild='cmake --build .'

# Network aliases
alias wifi="\$(if [[ \"\$(nmcli radio wifi)\" = \"enabled\" ]]; then nmcli radio wifi off; else nmcli radio wifi on; fi)"

# Arch-specific aliases (from https://codeberg.org/Gaming-Linux-FR/Architect)
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
alias update-arch='sudo pacman -Syu && sudo flatpak update && rustup update && cargo install-update --all && opam update && opam upgrade'
alias update-mirrors='sudo reflector --verbose --protocol https --score 100 --latest 30 --fastest 5 --sort rate -c FR,DE,CH --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'
alias clean-arch='sudo pacman -Sc'

if [[ -x "$(command -v zoxide)" ]]; then
  eval "$(zoxide init bash)"
fi

if [[ -z "${SSH_CONNECTION}" ]]; then
    export SSH_AUTH_SOCK="$XDG_RUNTIME_DIR/ssh-agent.socket"
fi

export HISTCONTROL=ignoreboth:erasedups
export HISTIGNORE="l *:clear"
export HISTIGNORE="ll *:clear"
export HISTIGNORE="ls *:clear"
export PROMPT_COMMAND='history -a'

# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/maelien/.opam/opam-init/init.sh' ]] || source '/home/maelien/.opam/opam-init/init.sh' > /dev/null 2> /dev/null
# END opam configuration
