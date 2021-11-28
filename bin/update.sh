#!/bin/sh

cd "$HOME/mininet/" || return

sudo apt-get purge mininet -y

git fetch --all
git tag

printf "\n%s" "Check out to latest version?: "
read -r op

if [ "${op}" = "y" ] || [ "${op}" = "Y" ]; then
    latestTag="$(git describe --tags "$(git rev-list --tags --max-count=1)")"
    git checkout -b "${latestTag}"
else
    printf "\n%s" "Please enter the tag you want to switch to: "
    read -r tag
    git checkout -b "${tag}"
fi

sudo PYTHON=python3 make install

printf "\n%s" "Do you want to run over the install script by mininet again? It attempts to reinstall everything again: "
read -r con

if [ "${con}" = "y" ] || [ "${con}" = "Y" ]; then
    PYTHON=python3 util/install.sh -a
fi
