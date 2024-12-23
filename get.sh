#!/usr/bin/bash

# get list of package
pacman -Qqne > ne.txt # native explicite
pacman -Qqme > me.txt # AUR explicite
pacman -Qqnd > nd.txt # native dependencies
pacman -Qqmd > md.txt # AUR dependencies

# get number of package
pacman -Q | wc -l > nb

# get flatpak list
flatpak list --columns=application -a > fd.txt # dependencies and explicite
flatpak list --columns=application --app > fe.txt # explicite

# add flatpak number to nb
cat fd.txt | wc -l >> nb

# for flatpak: remove explicite from dependencies
fe=$(cat $"fe.txt")
for i in $fe; do
  sed -i "/^${i}$/d" ./fd.txt
done

# add list of personal files
echo "$(ls -A ~)" > home/home.txt
echo "$(ls ~/.cache)" > home/cache.txt
echo "$(ls ~/.config)" > home/config.txt
echo "$(ls ~/.local/state)" > home/state.txt
echo "$(ls ~/.local/share)" > home/share.txt
