#!/usr/bin/bash

pacman -Qqne > ne.txt
pacman -Qqme > me.txt
pacman -Qqnd > nd.txt
pacman -Qqmd > md.txt

pacman -Q | wc -l > nb

