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

echo Installing AUR Softwares...
# You can solve users running this script as root with this and then doing the same for the next for statement. However I will leave this up to you.

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
# 'intellij-idea-community-edition'
'lightly-git' # KDE Theme
'lightlyshaders-git' # KDE theming
# 'mangohud' # Gaming FPS Counter
# 'mangohud-common'
'nerd-fonts-fira-code'
'nordic-darker-standard-buttons-theme' # KDE theming
'nordic-darker-theme' # KDE theming
'nordic-kde-git' # KDE theming
'nordic-theme' # KDE theming
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
# 'visual-studio-code-bin'
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

# Select IDE for development
echo '----------------------------------'
echo 'Choose your IDE'
echo '1 = VSCode 2 = IntelliJ IDEA Anything else = both'
read -p 'Selection: ' IDE_SELECTION
echo '----------------------------------'

if [ $IDE_SELECTION == 1 ]
then echo 'You chose VSCode'
# Install VSCode
bash ~/ArchForce/install_vscode.sh
elif [ $IDE_SELECTION == 2 ]
then echo 'You chose IDEA'
bash ~/ArchForce/install_intellij.sh
else echo 'You chose both'
bash ~/ArchForce/install_vscode.sh
bash ~/ArchForce/install_intellij.sh
fi

echo -e "\nDone!\n"
exit
