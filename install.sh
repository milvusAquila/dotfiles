#!/usr/bin/bash

# setup nvim
if [[ -d ~/.config/nvim ]]; then
	mv ~/.config/nvim ~/.config/nvim-old
fi
ln -s "${PWD}/nvim" ~/.config/nvim
