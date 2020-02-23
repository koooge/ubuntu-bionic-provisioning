#!/bin/bash -e

# Usage `./install_golang.sh && source ~/.bash_profile`

GO_VERSION=1.13.8
PECO_VERSION=v0.5.7

GO_URL=https://dl.google.com/go/go${GO_VERSION}.linux-amd64.tar.gz

install_gvm() {
  echo ""
}

install_golang() {
  wget -qO - ${GO_URL} | sudo tar zxC /usr/local

  cp ./.bash.d/go.sh ${HOME}/.bash.d/
  export PATH=${PATH}:/usr/local/go/bin
  export GOPATH=${HOME}/go
}

go_get_packages() {
  go get golang.org/x/tools/cmd/godoc
  go get golang.org/x/tools/cmd/goimports
#  go get golang.org/x/tools/cmd/gorename
#  go get golang.org/x/tools/cmd/guru

#  go get github.com/golang/lint/golint
  go get github.com/motemen/gore
  go get github.com/motemen/ghq
	echo "" >> ~/.gitconfig
	echo "[ghq]" >> ~/.gitconfig
	echo "	root = ${HOME}/go/src" >> ~/.gitconfig

  wget -qO - https://github.com/peco/peco/releases/download/${PECO_VERSION}/peco_linux_amd64.tar.gz | tar zxf - -C /tmp/
  cp /tmp/peco_linux_amd64/peco ${GOPATH}/bin/
}

# install_gvm
install_golang
go_get_packages

go version
