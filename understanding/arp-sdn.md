# ARP in SDN

## Brief

Like in traditional networks, ARP spoofing exists in SDN, and is a very dangerous opponent to tackle. The controller, which is generally what this attack targets, can be fooled into sending sensitive information to a compromised device following an undetected entry, and pushing seemingly arbitrary and nonchalant (which are in reality, malicious layer two addresses) to populate (which can be objectively considered as "polluting" the address table) to glean information and then attack the core of the network.

ARP spoofing masks the MAC (hardware) address of a host, and can direct multiple IP (layer three) addresses to a selection of hosts. This can work in multiple ways like a Man-in-the-middle (MITM) attack, or as a frontrunner to a DoS (or a DDoS) attack.

## Some methods to prevent an ARP attack on an SDN system.

From the research that we have done, there are a few well-known ways to prevent an ARP attack on an SDN system. Some techniques to prevent ARP spoofing have already been made standard in most networks: things like secure, cryptographic network protocols like SSH, HTTPS, and other forms of TLS, along with valid and auto-renewal of certificates. But this doesn't seem to be enough to stop ARP spoofing in SDN.

- All ARP packets, being passed through the controller, must be verified to have the correct MAC and IP address. If either one of them is incorrect, then the packet(s) must be dropped. Finally, if the packet indicates a new host, it must be added to the table.
- A similar thing can be done with individual switches in the network, but that will take a bit more configuration. Making this a requisite in switch data flows alleviates some of the processing burden from the controller, and makes it easier for the network to detect malicious actors in the process.
    - However, this approach has a disadvantage. Because the switches are controlled by the controller, there is a slight latency in decision-making on the part of the switches, because they need to forward the details of the incident to the controller for a response. If, during this slight delay, there is, either a separate malicious system, or a specific module of the existing system that acts on the connection, it can potentially infect the network (because the data path to the controller is open, and it is trivial to mask a packet to escape the preliminary checks in the path from the switch to controller). Complete isolation techniques also exist, however they are more resource expensive, and are generally difficult to manage.

Link: https://drive.google.com/drive/folders/147qDcogGA41wCjET18C2v_t3IFYqSzEN
