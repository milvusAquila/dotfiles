#!/usr/bin/bash

FILE_PATH="$(realpath "$(dirname "$0")")"

function exec_log() {
	local -r cmd="$1"
	local -r comment="$2"
	eval "${cmd}"
	echo "${comment}"
}
function install_file() {
	local -r real=$1
	local -r dot=$2
	if [[ -L "${real}" ]]; then
		rm "${real}"
	elif [[ -f "${real}" ]]; then
		mv "${real}" "${real}.bak"
	fi
	exec_log "ln -s ${FILE_PATH}/${dot} ${real}" "Create link from ${real} to ${FILE_PATH}/${dot}"
}
function install_folder() {
	local -r real=$1
	local -r dot=$2
	if [[ -L "${real}" ]]; then
		rm "${real}"
	elif [[ -d "${real}" ]]; then
		mv "${real}" "${real}.bak"
	fi
	exec_log "ln -s ${FILE_PATH}/${dot} ${real}" "Create link from ${real} to ${FILE_PATH}/${dot}"
}

# setup nvim
install_folder "${HOME}/.config/nvim" "nvim"

# setup oh-my-zsh
install_file "${HOME}/.zshrc" "zshrc"

# setup power10k
install_file "${HOME}/.p10k.zsh" "p10k.zsh"

# setup vim
install_file "${HOME}/.vimrc" "vimrc"

# setup XCompose
install_file "${HOME}/.XCompose" "XCompose"
