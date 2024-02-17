#!/usr/bin/bash

function install_file() {
	local -r real=$1
	local -r dot=$2
	if [[ -L "${real}" ]]; then
		rm "${real}"
	elif [[ -f "${real}" ]]; then
		mv "${real}" "${real}-old"
	fi
	ln -s "${PWD}/${dot}" "${real}"
}
function install_folder() {
	local -r real=$1
	local -r dot=$2
	if [[ -L "${real}" ]]; then
		rm "${real}"
	elif [[ -d "${real}" ]]; then
		mv "${real}" "${real}-old"
	fi
	ln -s "${PWD}/${dot}" "${real}"
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
