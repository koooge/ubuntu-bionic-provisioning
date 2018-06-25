#!/bin/bash -e

install_apt_packages() {
  sudo apt-get update -qq
  sudo apt-get dist-upgrade -y
  sudo apt-get install -y curl git zip unzip bzip2 \
    ntp \
    gcc g++ make bison \
    vim global \
    tig tree jq dos2unix lv silversearcher-ag
}

install_bash_profile() {
  mkdir ${HOME}/.bash.d
  cp -p .bash_profile ${HOME}/
}

install_languages() {
#  ./install_ruby.sh
  ./install_node.sh
  ./install_golang.sh
#  ./install_java.sh
}

install_middlewares() {
  ./install_docker.sh
}

install_tools() {
#  ./tool/install_heroku.sh
  ./tool/install_awscli.sh
# ./tool/install_gcloud.sh
  ./tool/install_kubectl.sh
}

install_apt_packages
install_bash_profile
curl -L raw.github.com/koooge/dotfiles/master/install.sh | bash

install_languages
install_middlewares
install_tools