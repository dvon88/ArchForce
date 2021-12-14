#!/usr/bin/env bash

# Install VSCode
yay -S --noconfirm --needed visual-studio-code-bin
# Install extensions for VSCode
code --install-extension dbaeumer.vscode-eslint
code --install-extension salesforce.salesforcedx-vscode
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph
code --install-extension chuckjonas.apex-pmd
code --install-extension esbenp.prettier-vscode