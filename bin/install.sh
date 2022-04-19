#!/bin/sh

printf "\n%s%s\n" "Installing mininet at " "$HOME"
cd "$HOME" || return
git clone https://github.com/mininet/mininet

cd mininet || return

latestTag="$(git describe --tags "$(git rev-list --tags --max-count=1)")"
printf "\n%s%s" "Checking out to " "${latestTag}"
git checkout "${latestTag}"

./util/install.sh -a

# Install ovs switch
sudo apt-get install openvswitch-switch -y

printf "\n\n%s\n" "Testing mininet installation"
sudo mn --switch ovsbr --test pingall
sudo mn --version

printf "\n%s" "Cleanup?: "
read -r op
if [ "${op}" = "y" ] || [ "${op}" = "Y" ]; then
    sudo mn -c
fi
