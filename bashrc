# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
    . /etc/bashrc
fi

# Load PS1 (same as fedora in the bash-color-prompt package)
if [ -f /etc/profile.d/bash-color-prompt.sh ]; then
    . /etc/profile.d/bash-color-prompt.sh
fi

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

export EDITOR=nvim

alias ls="ls --color=auto"
alias l="ls -A"
alias ll="ls -lAh"
alias py="python"
alias df="df -h"
alias n="nvim -O"
alias rgrep="grep -R . -ne"
alias venv="source bin/activate"
alias ff='fastfetch'
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

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


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/home/maelien/.opam/opam-init/init.sh' ]] || source '/home/maelien/.opam/opam-init/init.sh' > /dev/null 2> /dev/null
# END opam configuration
