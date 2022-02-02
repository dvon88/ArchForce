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
source $HOME/ArchForce/setup.conf

cd ~
git clone "https://aur.archlinux.org/yay.git"
cd ~/yay && pwd && sleep 15
makepkg -si --noconfirm && sleep 15
cd ~ && pwd && sleep 15
touch "~/.cache/zshhistory"
git clone "https://github.com/ChrisTitusTech/zsh"
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
ln -s "~/zsh/.zshrc" ~/.zshrc

echo -n "Installing AUR packages..." && sleept 5
yay -S --noconfirm --needed - < ~/ArchForce/pkg-files/aur-pkgs.txt

echo -n "Installing Konsave..." && sleep 5
export PATH=$PATH:~/.local/bin
cp -r ~/ArchForce/dotfiles/* ~/.config/
pip install konsave
konsave -i ~/ArchForce/kde.knsv
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
bash ~/ArchForce/install_vscode.sh && sleep 5
elif [ $IDE_SELECTION == 2 ]
then echo 'You chose IDEA'
bash ~/ArchForce/install_intellij.sh
else echo 'You chose both'
bash ~/ArchForce/install_vscode.sh
bash ~/ArchForce/install_intellij.sh
fi

echo -e "\nDone!\n"
exit
