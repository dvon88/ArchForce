#!/usr/bin/env bash

# Install VSCode
yay -S --noconfirm visual-studio-code-bin
# Install extensions for VSCode
code --isntall-extension dbaeumer.vscode-eslint
code --install-extension salesforce.salesforce-vscode-slds
code --install-extension salesforce.salesforcedx-vscode-apex
code --install-extension salesforce.salesforcedx-vscode-apex-replay-debugger
code --install-extension salesforce.salesforcedx-vscode-core
code --install-extension salesforce.salesforcedx-vscode-lightning
code --install-extension salesforce.salesforcedx-vscode-soql
code --install-extension salesforce.salesforcedx-vscode-visualforce
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph