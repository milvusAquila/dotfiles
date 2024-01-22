#!/usr/bin/bash

# setup nvim
if [[ -d ~/.config/nvim ]]; then
	mv ~/.config/nvim ~/.config/nvim-old
fi
ln -s "${PWD}/nvim" ~/.config/nvim

# setup oh-my-zsh
if [[ -f ~/.zshrc ]]; then
	mv ~/.zshrc ~/.zshrc-old
fi
ln -s "${PWD}/zshrc" ~/.zshrc

# setup power10k
if [[ -f ~/.p10k.zsh ]]; then
	mv ~/.p10k.zsh ~/.p10k.zsh-old
fi
ln -s "${PWD}/p10k.zsh" ~/.p10k.zsh

# setup vim
if [[ -d ~/.vimrc ]]; then
	mv ~/.vimrc ~/.vimrc-old
fi
ln -s "${PWD}/vimrc" ~/.vimrc

# setup XCompose
if [[ -d ~/.XCompose ]]; then
	mv ~/.XCompose ~/.XCompose-old
fi
ln -s "${PWD}/XCompose" ~/.XCompose
