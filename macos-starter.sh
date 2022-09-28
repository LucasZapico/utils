#!/bin/bash

##
## Array of app to be installed
## 
BrewCasks=('dbngin' 'loom' 'dropbox' 'clipy' 'devdocs' 'insomnia' 'brave-browser' 'firefox' 'lepton' 'iterm2' 'slack' 'rectangle' 'discord' 'fantastical' 'notion' 'bartender' 'figma' 'visual-studio-code' 'homebrew/cask-versions/google-chrome-canary' 'google-chrome' '1password' 'db-browser-for-sqlite-nightly' )

##
## Array of packages to be install
## 
BrewPackages=(vim zsh node 'python@3.9' pandoc rbenv, typescript  'mas' 'ffmpeg')

##
## Array of Mac App store app to be installed
##
MacAppStore=('')
##
## Colors
##
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green
Yellow='\033[0;33m'       # Yellow
Blue='\033[0;34m'         # Blue
Purple='\033[0;35m'       # Purple
Cyan='\033[0;36m'         # Cyan
White='\033[0;37m'        # White
NC='\033[0m'             # No Color

YREGEX="[yY]" 
YESREGEX="[yY][eE][sS]"


##
## install zshrc
##
echo -e "${Cyan}Would you like to install ohmyzsh?${NC} (y/n):"
read CONFRIM
if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  # install deta 
  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
else 
  echo "ohmyzsh not init"
fi


##
## install brew
##
install_brew(){
  echo -e "${Cyan} start installing brew${NC}"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo -e "${Cyan} end installing brew${NC}"
  wait
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"'
}

echo -e "${Cyan}Would you like to install HomeBrew${NC}? (y/n):"
read CONFRIM
if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  install_brew
else 
  echo "HomeBrew not installed"
fi



## 
## brew packages
## 
installBrewPackages() {
 
  echo -e "${Cyan}Would you like to install all package ${NC}? (y/n):"
  read INSTALLALL
  for i in "${BrewPackages[@]}"; do
      if [[ $INSTALLALL =~ $YREGEX || $INSTALLALL =~ $YESREGEX ]]; then
        echo -e "${Green}start: installing $i via brew${NC}"
        brew install $i
        echo -e "${Green}end: $i installed via brew${NC}"
      else 
        echo -e "${Cyan}Would you like to install ${i}${NC}? (y/n):"
        read CONFRIM
        
        if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
          echo -e "${Green}start: installing $i via brew${NC}"
          brew install $i
          echo -e "${Green}end: $i installed via brew${NC}"
        else 
          echo "${i} not installed"
        fi
      fi
  done
  return 1
}


# for i in "${arrayName[@]}"; do
#   echo $i
# done

set_alias(){

echo -e "${Cyan}Would you like to Alias python3 to python ${NC}? (y/n):"
read CONFRIM

if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  # alias lastest python to python
  alias python=python3
  alias pip=pip3

fi
}

# 
# install brew casks 
#
installBrewCasks() {

  for i in "${BrewCasks[@]}"; do
    echo -e "${Cyan}Would you like to install ${i}${NC}? (y/n):"
      read CONFRIM
      
      if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
        echo -e "${Green} start: ${NC}installing $i cask via brew"
        brew install --cask $i
        echo -e "${Green} end: ${NC}  $i  cask installed via brew"
      else 
        echo "${i} not installed"
      fi
  done
  return 1
}

github_config(){

##
## Git username and email for git setup
## 
echo -e "${Cyan}Would you like to configure Github?${NC} (y/n):"
read CONFRIM
##
## TODO: add a check user name is correct 
##
if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  echo "Enter github username" 
  read GITUSERNAME
  echo "Enter github email" 
  read GITEMAIL
  echo "${GITUSERNAME}, ${GITEMAIL}"
  git config --global user.email ${GITEMAIL}
  git config --global user.name ${GITUSERNAME}

else 
  echo "github not confirmed"
fi
}

ruby_setup(){
# init ruby env 
echo -e "${Cyan}Would you like to init rbenv?${NC} (y/n):"
read CONFRIM

##
## TODO: add a check user name is correct 
##
if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  rbenv init
else 
  echo "rbenv not init"
fi
}

install_deta(){
  # 
echo -e "${Cyan}Would you like to install deta?${NC} (y/n):"
read CONFRIM
if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  # install deta 
  sh -c "$(curl -fsSL https://get.deta.dev/cli.sh | sh)"
else 
  echo "deta not init"
fi
}

install_unverified_apps(){
  echo -e "${Yellow}⚠️ Warning: Don't do 👇 if you don't know what it is?${NC}"
  echo -e "${Cyan}Would you like to enable install of apps from 'unverified developers'?${NC} (y/n):"
  read CONFRIM
  if [[ $CONFRIM =~ $YREGEX || $CONFRIM =~ $YESREGEX ]]; then
  # open apps from unverified developers
  sudo spctl --master-disable
  fi
}

export installBrewPackages
export installBrewCasks
export github_config
export set_alias
export ruby_setup
export install_deta
export install_unverified_apps




