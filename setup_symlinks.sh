#!/usr/bin/env bash

# ~/.config
ln -sfv "$(pwd)"/config/* -t "$HOME"/.config/

# ~
(
	cd ./home
	for file in *; do
		ln -sfv "$(pwd)/$file" "$HOME"/."$file"
	done
)