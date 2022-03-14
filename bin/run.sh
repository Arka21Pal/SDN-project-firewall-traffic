#!/bin/sh

# The idea is to be able to choose between the different subparts of the two different attacks

# For arp attack,
# sudo mn --custom "${ARP_TOPO}" --topo=mytopo --controller=remote,ip=127.0.0.1
# To simulate ARP attacks,
# H2 and H4 cannot send HTTP traffic amongst each other, so
# > h2 python3 -m http.server 80 &
# > h4 wget -O - h2
# H1 and H4 cannot send UDP traffic amongst each other
# > h1 iperf -s -u -i 1 &
# > h4 iperf -c 10.0.0.1 -u -b 1m -n 1000

# Taken from:
# https://github.com/madhav-prabhu/SDN/tree/main/Part3
# https://stackoverflow.com/a/35993440
# http://mininet.org/walkthrough/#run-a-simple-web-server-and-client

# For ddos attack,
# first check if "detect.py" and "l3.py" exist in "$HOME/pox/pox/forwarding/"
# If they don't, link them
# Then,
# cd to "$HOME/pox"
# ./pox.py forwarding.l3
# sudo mn --topo=tree,2,3 --controller=remote,ip=127.0.0.1
# To simulate ddos traffic,
# > h4 sudo hping3 --faster --rand-source 10.0.0.1
# To show same attack working without firewall,
# > h4 sudo hping3 --faster 10.0.0.1

# Taken from:
# https://github.com/arunnair018/DDoS-detection-and-mitigation-in-SDN-controller
# https://www.youtube.com/watch?v=Jqg5hy_2w1w (01:33)


PROJECT_PATH="${HOME}/git-repos/SDN-project-firewall-traffic/"

ARP_PART="${PROJECT_PATH}/arp/"
ARP_TOPO="${ARP_PART}/p3_custom_topology.py"
ARP_CONTROLLER="${ARP_PART}/p3_ryu_manager.py"

printf "\n%s" "What would you like to run?"
printf "\n%s" "To run the ARP topology, press \"t\""
printf "\n%s" "To run the controller with rules for ARP, press \"c\""
if read -r arp_option; then
    if [ "${arp_option}" = "t" ]; then
        sudo mn --custom "${ARP_TOPO}" --topo=mytopo --controller=remote,ip=127.0.0.1
    elif [ "${arp_option}" = "c" ]; then
        ryu-manager "${ARP_MANAGER}"

printf "\n%s" "After the topology is running and is connected to the controller, please execute the following:"
printf "\n%s" "This is to showcase that with the firewall running, H2 and H4 cannot send HTTP traffic amongst themselves"
printf "\n%s" "> h2 python3 -m http.server 80 &"
printf "\n%s" "> h4 wget -O - h2"
printf "\n%s" "H1 and H4 cannot send UDP traffic amongst each other"
printf "\n%s" "> h1 iperf -s -u -i 1 &"
printf "\n%s" "> h4 iperf -c 10.0.0.1 -u -b 1m -n 1000"



# tmux select-pane -L 2> /dev/null
# tmux select-pane -R 2> /dev/null
# tmux split-window -h 2> /dev/null























# sudo python3 "${1}"
# 
# printf "\n%s" "Cleanup?: "
# read -r op
# if [ "${op}" = "y" ] || [ "${op}" = "Y" ]; then
#     sudo mn -c
# fi
