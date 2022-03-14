#!/bin/sh

# The idea is to be able to choose between the different subparts of the two different attacks

# For arp attack,
# Start the controller with
# ryu-manager --verbose p3_ryu_manager.py
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

arp_flag=0
ddos_flag=0
topology_flag=0
controller_flag=0
comment_flag=0

while getopts "hadtcC" option
do
    case ${option} in
        h)
            printf "%s\n%s\n%s\n%s\n%s\n%s\n%s" "This script takes multiple flags, but no arguments" \
                "The flag \"-h\" shows this help message" \
                "The flag \"-a\" allows running the components related to ARP" \
                "The flag \"-d\" allows running the componenets related to DDoS" \
                "The flag \"-t\" runs the commands to form the topology in relation to whichever attack you've chosen" \
                "The flag \"-c\" runs the controller with the firewall rules for the respective attack" \
                "The flag \"-C\" displays comments on what to run in order to see logs for the attack and the prevention"
            exit
            ;;
        a)
            arp_flag=1
            ;;
        d)
            ddos_flag=1
            ;;
        t)
            topology_flag=1
            ;;
        c)
            controller_flag=1;
            ;;
        C)
            comment_flag=1
            ;;
        ?)
            printf "Usage: %s: [-a] [-d] [-t] [-c] [-C] args\n" "${0}"
            exit 2
            ;;
        esac
done

if [ "${arp_flag}" = 1 ]; then

    ddos_flag=0

    ARP_PART="${PROJECT_PATH}/arp/"
    ARP_TOPO="${ARP_PART}/p3_custom_topology.py"
    ARP_CONTROLLER="${ARP_PART}/p3_ryu_manager.py"

    if [ "${comment_flag}" = 1 ]; then
        printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s" "After the topology is running and is connected to the controller, please execute the following commands" \
            "This is to showcase that with the firewall running, H2 and H4 cannot send HTTP traffic amongst themselves" \
            "> h2 python3 -m http.server 80 &" \
            "> h4 wget -O - h2" \
            "To show that H1 and H4 cannot send UDP traffic amongst each other" \
            "> h1 iperf -s -u -i 1 &" \
            "> h4 iperf -c 10.0.0.1 -u -b 1m -n 1000"

        topology_flag=0
        controller_flag=0
        # exit 0
    fi

    if [ "${topology_flag}" = 1 ]; then
        printf "\n%s\n%s\n%s" "To run the topology without the controller, i.e. to show the attack, press \"n\"" \
            "To run the topology with the controller, i.e. to show the prevention, press \"c\"" \
            "-> "
        read -r control
        if [ "${control}" = "c" ]; then
            sudo mn --custom "${ARP_TOPO}" --topo=mytopo --controller=remote,ip=127.0.0.1
        fi
        if [ "${control}" = "n" ]; then
            sudo mn --custom "${ARP_TOPO}" --topo=mytopo
        fi
    fi
    if [ "${topology_flag}" = 1 ]; then
        sudo mn --custom "${ARP_TOPO}" --topo=mytopo --controller=remote,ip=127.0.0.1
    fi

    if [ "${controller_flag}" = 1 ]; then
        ryu-manager --verbose "${ARP_CONTROLLER}"
    fi
fi

if [ "${ddos_flag}" = 1 ]; then

    arp_flag=0

    if [ "${comment_flag}" = 1 ]; then
        printf "\n%s\n%s\n%s\n%s\n%s\n%s\n%s" "First, we need to check if \"detect.py\" and \"l3.py\" exist in \"\$HOME/pox/pox/forwarding\"" \
            "After the topology is running and is connected to the controller, please execute the following commands" \
            "To simulate DDoS traffic between H4 and H1, please enter" \
            "> h4 sudo hping3 --faster --rand-source 10.0.0.1" \
            "To show the same attack working without the firewall, do not start the controller, and run the topology without the \"--remote\" option, i.e.;" \
            "$ sudo mn --topo=tree,2,3" \
            "> h4 sudo hping3 --faster 10.0.0.1"

        topology_flag=0
        controller_flag=0
        # exit 0
    fi

    if [ "${topology_flag}" = 1 ]; then
        printf "\n%s\n%s\n%s" "To run the topology without the controller, i.e. to show the attack, press \"n\"" \
            "To run the topology with the controller, i.e. to show the prevention, press \"c\"" \
            "-> "
        read -r control
        if [ "${control}" = "c" ]; then
            sudo mn --topo=tree,2,3 --controller=remote,ip=127.0.0.1
        fi
        if [ "${control}" = "n" ]; then
            sudo mn --topo=tree,2,3
        fi
    fi

    if [ "${controller_flag}" = 1 ]; then
        "$HOME/pox/pox.py" "forwarding.l3"
    fi
fi
