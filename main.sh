#!/bin/bash

source $(dirname "$0")/macos_quickstart.sh 

##
## test command
##
echo "macOS up and running script"

installBrewPackages
installBrewCasks
github_config
set_alias
ruby_setup
install_deta
install_unverified_apps
