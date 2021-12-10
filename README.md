NEXT STEP: Get Java home set in VSCode for Salesforce extensions automatically

Automated script to fully install Arch Linux as well as many tools for Salesforce developers. Download an Arch ISO, boot it, install git, clone the script and run it.  
This will install JDK 11, the Salesforce CLI, VSCode, and the Salesforce Extension Pack for VSCode all automatically as well as some other programs to aid. All you will have to do is set your Java home within the Salesforce extension settings, then log into an org, and you are ready to go!  
SFDX CLI (obviously)  
VSCode (not OSS code as that does not natively support the MS Marketplace extensions where SF extensions live)  
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
About halfway through, you will be prompted for your username, password, and hostname. At the end, use ```reboot```, then select Boot Existing OS.  
To finalize VSCode setup, open your User Settings and set the Java home under Salesforce Extension settings to your Java home location.  
This should be something like ```/usr/lib/jvm/java-11-openjdk```  

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

- Original script was built by ChrisTitusTech (subscribe to his YouTube and support!). This is a forked version of that
- Original packages script was a post install cleanup script called ArchMatic located here: https://github.com/rickellis/ArchMatic
- Thank you to all the folks that helped during the creation from YouTube Chat! Here are all those Livestreams showing the creation: <https://www.youtube.com/watch?v=IkMCtkDIhe8&list=PLc7fktTRMBowNaBTsDHlL6X3P3ViX3tYg>
