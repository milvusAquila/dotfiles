#!/usr/bin/bash

FILE_PATH="$(realpath "$(dirname "$0")")"

function exec_log() {
	local -r cmd="$1"
	local -r comment="$2"
	eval "${cmd}"
	echo "${comment}"
}

function install() {
	local -r real=$1
	local -r dot=$2
	if [[ -L "${real}" ]]; then
		rm "${real}"
	elif [[ -f "${real}" || -d "${real}" ]]; then
		mv "${real}" "${real}.bak"
	fi
	source="$(realpath -s --relative-to "$(dirname "${real}")" "${FILE_PATH}/${dot}")"
	exec_log "ln -s ${source} ${real}" "Create link from ${real} to ${source}"
}

# setup nvim
install "${HOME}/.config/nvim" "nvim"

# setup oh-my-zsh
install "${HOME}/.zshrc" "zshrc"

# setup power10k
install "${HOME}/.p10k.zsh" "p10k.zsh"

# setup vim
install "${HOME}/.vimrc" "vimrc"

# setup XCompose
install "${HOME}/.XCompose" "XCompose"
