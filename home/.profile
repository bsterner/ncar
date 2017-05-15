#echo "-> [ ~/.profile initializing for '$USER' ]"

#echo "Fish dir: /Users/bsterner/.config/fish/functions"

# == Global Config ==

PATH=$PATH:/usr/local/Cellar/perl/5.24.1/bin
PATH=$PATH:/Users/bsterner/.rvm/bin
PATH=$PATH:/Users/bsterner/.rvm/gems/ruby-2.3.1/bin
PATH=$PATH:/Users/bsterner/.rvm/gems/ruby-2.3.1@global/bin
PATH=$PATH:/Users/bsterner/.rvm/rubies/ruby-2.3.1/bin
PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin
PATH=$PATH:/usr/local/Cellar/mobile-shell/1.2.6_4/bin
PATH=$PATH:/usr/local/mysql/bin

PATH=$PATH:/usr/local/sbin

PATH=$PATH:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/local/MacGPG2/bin

export PATH

# == App Config ==
export LOG_DIR="/Users/bsterner/tmp/log"
export DEV_DIR=~/Development
export DOCKER_DIR=$DEV_DIR/docker
export SECURITY_DIR=$DEV_DIR/security
export IJWS_DIR=$DEV_DIR/ijworkspace
export XSEDE_DIR=$IJWS_DIR/xsede
export XDMOD_DIR=$IJWS_DIR/xdmod
export SAM_DIR=$IJWS_DIR/sam
export INTELLIJ_TOMCAT_DIR=~/Library/Caches/IntelliJIdea2017.1/tomcat
export AMIE_DISTRO=~/Development/ijworkspace/xsede/amie-distro
export GITHUB_DIR=$DEV_DIR/github
export GITHUB_MAIN=$GITHUB_DIR/main/ncar
export DOCKER_DIR=$GITHUB_MAIN/docker
export SCRIPTS_DIR=$GITHUB_MAIN/scripts
export NCAR_DOCKER_DIR=$GITHUB_DIR/ncar
export SWEG_DOCKER_DIR=$NCAR_DOCKER_DIR/sweg-docker

# == Tomcat Run from Command Line (No IntelliJ) ==
export CATALINA_HOME=/Users/bsterner/Development/apache-tomcat-7.0.72
export CATALINA_BASE=/Users/bsterner/Development/apache-tomcat-webapps/sam-base

PATH=$PATH:$SWEG_DOCKER_DIR/sweg-docker-util
PATH=$PATH:$SCRIPTS_DIR
PATH=$PATH:$SCRIPTS_DIR/xras

# === RVM / Ruby / Rails Config ===
# Initialize rvm as a function
[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"

SECRET_KEY_BASE=e763ed79fcc4fb6c2637a50d37b4f8f877fcd1be2ca793c38d3264698262e173da9afb5e783f7174263907754037ab856cc26a731c51f79465969eb36d1bd2dd

#RAILS_ENV="test"
RAILS_ENV="development"
RUBYOPT="-W0"

export SECRET_KEY_BASE RAILS_ENV RUBYOPT

# === Perl Config ===

# Homebrew version of perl
#If you need to have this software first in your PATH run:
#echo 'export PATH="/usr/local/opt/perl@5.18/bin:$PATH"' >> ~/.bash_profile

#For compilers to find this software you may need to set:
#LDFLAGS:  -L/usr/local/opt/perl@5.18/lib

# === Amie Config ===
export AMIELOCAL=$AMIE_DISTRO/PSC-config
export AMIE=$AMIE_DISTRO/amie
export PATH=$PATH:$AMIE/scripts

# === Source dependencies ===
source ~/.aliases
source ~/.prompt
source functions.sh
source /usr/local/etc/bash_completion
source <(kubectl completion bash)
