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
	src="$(realpath -s --relative-to "$(dirname "${real}")" "${FILE_PATH}/${dot}")"
	exec_log "ln -s ${src} ${real}" "Create link from ${src} to ${real}"
}

# setup sway
install "${HOME}/.config/sway" "sway"

# setup waybar
install "${HOME}/.config/waybar" "waybar"

# setup foot
install "${HOME}/.config/foot" "foot"

# setup bash
install "${HOME}/.bashrc" "bashrc"

# setup scripts
install "${HOME}/.config/scripts" "scripts"

# setup vim
install "${HOME}/.vimrc" "vimrc"

# setup XCompose
install "${HOME}/.XCompose" "XCompose"

# setup gitconfig
install "${HOME}/.gitconfig" "gitconfig"
