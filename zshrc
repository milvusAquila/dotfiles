export EDITOR=vim
# Path to your oh-my-zsh installation.
export ZSH=$HOME/dotfiles/ohmyzsh
export PATH=$PATH:~/.cargo/bin

ZSH_THEME="robbyrussell"

# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git rust podman extract adb) # zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting zsh-autocomplete)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

###############################################################################

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export LC_ALL=C

# Standard aliases
alias ls="ls --color=auto"
alias l="ls -A"
alias ll="ls -lAh"
alias py="python"
alias df="df -h" # --human-readable
alias n="nvim"
alias kvm="qemu-system-x86_64"
alias venv="source bin/activate"
alias pd="podman"
alias battery="upower -i /org/freedesktop/UPower/devices/battery_BAT0"

# Network aliases
alias ip="ip -c=always"
alias wifi="\$(if [[ \"\$(nmcli radio wifi)\" = \"enabled\" ]]; then nmcli radio wifi off; else nmcli radio wifi on; fi)"
alias dhcp="sudo sed -i '/DHCP=yes/s/^#//g' /etc/systemd/network/20-wired.network &&\
  sudo sed -i '/Gateway=192.168.0.254/s/^/#/g' /etc/systemd/network/20-wired.network &&\
  sudo sed -i '/Address=192.168.0.11\/24/s/^/#/g' /etc/systemd/network/20-wired.network &&\
  sudo systemctl restart systemd-networkd"
alias static="sudo sed -i '/DHCP=yes/s/^/#/g' /etc/systemd/network/20-wired.network &&\
  sudo sed -i '/Gateway=192.168.0.254/s/^#//g' /etc/systemd/network/20-wired.network &&\
  sudo sed -i '/Address=192.168.0.11\/24/s/^#//g' /etc/systemd/network/20-wired.network &&\
  sudo systemctl restart systemd-networkd"

# Arch-specific aliases (from https://github.com/Gaming-Linux-FR/Architect)
alias fix-key='sudo rm /var/lib/pacman/sync/* && sudo rm -rf /etc/pacman.d/gnupg/* && sudo pacman-key --init && sudo pacman-key --populate && sudo pacman -Sy --noconfirm archlinux-keyring && sudo pacman --noconfirm -Su'
alias update-arch='yay && sudo flatpak update && rustup update && cargo install-update --all omz update'
alias update-mirrors='sudo reflector --verbose --score 100 --latest 20 --fastest 5 --sort rate --save /etc/pacman.d/mirrorlist && sudo pacman -Syyu'
alias clean-arch='yay -Sc && yay -Yc'

eval "$(zoxide init zsh)"
