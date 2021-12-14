#!/bin/bash

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchForce/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchForce/kde.knsv
sleep 1
konsave -a kde
