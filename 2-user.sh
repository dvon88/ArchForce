#!/usr/bin/env bash
#-------------------------------------------------------------------------
# ▄▄▄       ██▀███   ▄████▄   ██░ ██   █████▒▒█████   ██▀███   ▄████▄  ▓█████ 
#▒████▄    ▓██ ▒ ██▒▒██▀ ▀█  ▓██░ ██▒▓██   ▒▒██▒  ██▒▓██ ▒ ██▒▒██▀ ▀█  ▓█   ▀ 
#▒██  ▀█▄  ▓██ ░▄█ ▒▒▓█    ▄ ▒██▀▀██░▒████ ░▒██░  ██▒▓██ ░▄█ ▒▒▓█    ▄ ▒███   
#░██▄▄▄▄██ ▒██▀▀█▄  ▒▓▓▄ ▄██▒░▓█ ░██ ░▓█▒  ░▒██   ██░▒██▀▀█▄  ▒▓▓▄ ▄██▒▒▓█  ▄ 
# ▓█   ▓██▒░██▓ ▒██▒▒ ▓███▀ ░░▓█▒░██▓░▒█░   ░ ████▓▒░░██▓ ▒██▒▒ ▓███▀ ░░▒████▒
# ▒▒   ▓▒█░░ ▒▓ ░▒▓░░ ░▒ ▒  ░ ▒ ░░▒░▒ ▒ ░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░░ ░▒ ▒  ░░░ ▒░ ░
#  ▒   ▒▒ ░  ░▒ ░ ▒░  ░  ▒    ▒ ░▒░ ░ ░       ░ ▒ ▒░   ░▒ ░ ▒░  ░  ▒    ░ ░  ░
#  ░   ▒     ░░   ░ ░         ░  ░░ ░ ░ ░   ░ ░ ░ ▒    ░░   ░ ░           ░   
#      ░  ░   ░     ░ ░       ░  ░  ░           ░ ░     ░     ░ ░         ░  ░
#                   ░                                         ░               
#
#-------------------------------------------------------------------------

echo -e "\nINSTALLING AUR SOFTWARE\n"
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

echo "CLONING: YAY"
cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ${HOME}/yay
makepkg -si --noconfirm
cd ~
touch "$HOME/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/powerlevel10k
ln -s "$HOME/zsh/.zshrc" $HOME/.zshrc

PKGS=(
'autojump'
'awesome-terminal-fonts'
#'brave-bin' # Brave Browser
'dxvk-bin' # DXVK DirectX to Vulcan
'firefox'
'github-desktop-bin' # Github Desktop sync
'google-chrome' # Google Chrome for best Salesforce compatibility
'intellij-idea-community-edition'
'lightly-git'
'lightlyshaders-git'
'mangohud' # Gaming FPS Counter
'mangohud-common'
'nerd-fonts-fira-code'
'nordic-darker-standard-buttons-theme'
'nordic-darker-theme'
'nordic-kde-git'
'nordic-theme'
'noto-fonts-emoji'
'papirus-icon-theme'
'plasma-pa'
'ocs-url' # install packages from websites
'sddm-nordic-theme-git'
'snapper-gui-git'
'ttf-droid'
'ttf-hack'
'ttf-meslo' # Nerdfont package
'ttf-roboto'
'visual-studio-code-bin'
# 'zoom' # video conferences
'snap-pac'
# 'slack'
'teams'
'timeshift'
)

for PKG in "${PKGS[@]}"; do
    yay -S --noconfirm $PKG
done

# Download JDK 11
sudo pacman -Suy jre11-openjdk --noconfirm --needed
# Set default java version to Java 11
archlinux-java set java-11-openjdk

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

export PATH=$PATH:~/.local/bin
cp -r $HOME/ArchForce/dotfiles/* $HOME/.config/
pip install konsave
konsave -i $HOME/ArchForce/kde.knsv
sleep 1
konsave -a kde

echo "Installing SFDX CLI ..." && sleep 5
# INSTALL SALESFORCE CLI
wget https://developer.salesforce.com/media/salesforce-cli/sfdx/channels/stable/sfdx-linux-x64.tar.xz
mkdir ~/sfdx
tar xJf sfdx-linux-x64.tar.xz -C ~/sfdx --strip-components 1
echo "PATH=~/sfdx/bin:$PATH" >> ~/.bashrc

echo -e "\nDone!\n"
exit