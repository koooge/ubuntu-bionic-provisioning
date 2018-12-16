#!/bin/bash -e

# Usage: `$ ./install_python.sh`

install_packages() {
  pip install virtualenv --user
}

install_packages

python -V
pip -V
