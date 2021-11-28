#!/bin/sh

sudo python3 "${1}"

printf "\n%s" "Cleanup?: "
read -r op
if [ "${op}" = "y" ] || [ "${op}" = "Y" ]; then
    sudo mn -c
fi
