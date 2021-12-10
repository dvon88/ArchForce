This is a fork of ArchTitus by ChrisTitusTech (subscribe to his channel and support) that is aimed at Salesforce development. Auto-installed packages from the original were modified to remove unnecessary packages and add in the following...  
SFDX CLI (obviously)  
VSCode (not OSS code as that does not natively support the MS Marketplace extensions where SF extensions live)  
<<<<<<< HEAD
Salesforce Extension Pack for VSCode
=======
Salesforce Extension Pack for VSCode  
>>>>>>> ab9e427ccf40737206382d677f44ee2946dd280a
Google Chrome and Firefox (Brave does not always play well with SF in my experience)  
JDK11 (required for SF development)  
github CLI (newer github CLI, optional)  
x11-ssh-askpass (I repeatedly had issues with ssh-askpass not working, so git wouldn't work. Installed this and it works, just asks for ssh password, nbd)  
Teams  
Slack  
Google Chat  
Timeshift  
...and others are coming as I improve on the script  

# ArchForce Installer Script

This README contains the steps I do to install and configure a fully-functional Arch Linux installation containing a desktop environment, all the support packages (network, bluetooth, audio, printers, etc.), along with all my preferred applications and utilities. The shell scripts in this repo allow the entire process to be automated.)

---
## Create Arch ISO or Use Image

Download ArchISO from <https://archlinux.org/download/> and put on a USB drive with [Etcher](https://www.balena.io/etcher/), [Ventoy](https://www.ventoy.net/en/index.html), or [Rufus](https://rufus.ie/en/)

## Boot Arch ISO

From initial Prompt type the following commands:

```
pacman -Sy git
git clone https://github.com/dvon88/ArchForce
cd ArchForce
./archforce.sh
```

### System Description
This is completely automated arch install of the KDE desktop environment on arch using various packages I typically use for Salesforce development, including some
communcation tools.  

This install stays in line with using terminal for all downloads and updates, so use ```pacman``` or ```yay``` to download/install/update programs!

## Troubleshooting

__[Arch Linux Installation Guide](https://github.com/rickellis/Arch-Linux-Install-Guide)__

### No Wifi

#1: Run `iwctl`

#2: Run `device list`, and find your device name.

#3: Run `station [device name] scan`

#4: Run `station [device name] get-networks`

#5: Find your network, and run `station [device name] connect [network name]`, enter your password and run `exit`. You can test if you have internet connection by running `ping google.com`. 

## Credits

- Original packages script was a post install cleanup script called ArchMatic located here: https://github.com/rickellis/ArchMatic
- Thank you to all the folks that helped during the creation from YouTube Chat! Here are all those Livestreams showing the creation: <https://www.youtube.com/watch?v=IkMCtkDIhe8&list=PLc7fktTRMBowNaBTsDHlL6X3P3ViX3tYg>
