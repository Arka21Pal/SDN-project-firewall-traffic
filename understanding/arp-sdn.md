# ARP in SDN

## Brief

Like in traditional networks, ARP spoofing exists in SDN, and is a very dangerous opponent to tackle. The controller, which is generally what this attack targets, can be fooled into sending sensitive information to a compromised device following an undetected entry, and pushing seemingly arbitrary and nonchalant (which are in reality, malicious layer two addresses) to populate (which can be objectively considered as "polluting" the address table) to glean information and then attack the core of the network.

## The possible damage caused by ARP spoofing

ARP spoofing masks the MAC (hardware) address of a host, and can direct multiple IP (layer three) addresses to a selection of hosts. This can work in two ways:
- The attacker can have a Man-in-the-middle (MITM attack) which will intercept traffic for a particular device, thus giving the attacker any secrets meant for the legitimate host. In practice, such secrets are often used network-wide, which means that the attacker will have access to certain parts of the network and can probably influence traffic flow.
- An ARP attack can also be used as a frontrunner to a DoS (or a DDoS) attack, in which case, a single MAC address (i.e. a single host) is mapped to multiple IP addresses, which will eventually redirect a lot more traffic than expected to that specific host, overwhelming it.

## Some possible methods of prevention

Some techniques to prevent ARP spoofing have already been made standard in most networks: things like secure, cryptographic network protocols like SSH, HTTPS, and other forms of TLS, along with valid and auto-renewal of certificates. But this doesn't seem to be enough to stop ARP spoofing in SDN.

- All ARP packets, being passed through the controller, must be verified to have the correct MAC and IP address. If either one of them is incorrect, then the packet(s) must be dropped. Finally, if the packet indicates a new host, it must be added to the table.
- A similar thing can be done with individual switches in the network, but that will take a bit more configuration.

Link: https://drive.google.com/drive/folders/147qDcogGA41wCjET18C2v_t3IFYqSzEN

