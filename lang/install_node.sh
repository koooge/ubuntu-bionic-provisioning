#!/bin/bash -e

# Usage: `./install_node.sh`

NVM_VERSION="v0.35.0"
NODE_VERSION="lts/erbium"

install_nvm() {
  curl -sSo- https://raw.githubusercontent.com/creationix/nvm/${NVM_VERSION}/install.sh | bash
  source ${HOME}/.nvm/nvm.sh
}

install_node() {
  nvm install ${NODE_VERSION}
  nvm use ${NODE_VERSION}
  nvm alias default ${NODE_VERSION}
}

install_yarn() {
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  sudo apt-get update -qq && sudo apt-get install -y yarn
}

install_nvm
install_node
install_yarn

nvm version
node -v
