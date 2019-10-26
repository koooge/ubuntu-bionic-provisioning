#!/bin/bash -e

# Usage: `$ ./install_python.sh`

install_packages() {
  sudo apt-get update -qq && sudo apt-get install -y python3-pip python3-venv
  mkdir -p ${HOME}/.venv

  echo 'export PATH=${PATH}:${HOME}/.local/bin' >> ${HOME}/.bash_profile
}

install_packages

python3 -V
pip3 -V
