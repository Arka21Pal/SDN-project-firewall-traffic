# An SDN firewall to prevent ARP and DDoS attacks

The basic idea here is to prevent ARP and DDoS attacks in the simulated topologies (using Mininet).

**Note: This project was done on an Ubuntu VM with** `mininet`**,** `pox` **and** `ryu` **manually installed. In case something doesn't work on your system, please try to update the packages to the lastest version, or use an Ubuntu VM like me**. The script to install `mininet` and other components is `install.sh`, and `install-ryu.sh` to install `ryu` (in `./bin/`).

## This is how to run the project:

- `Symlink` (`ln -s`) `l3.py` and `detection.py` from `./ddos/` into `$HOME/pox/pox/forwarding`. It is important that the path remains the same (and it will be if you are using a `mininet` VM or manually run the `mininet` install script from their website on an Ubuntu VM).
    - In case *you have manually* changed the path to something else, go through `run.sh` in `./bin/` and modify the correct variable. You're also welcome to open an issue, but no guarantees.
- You're basically set at this point. Head over to `./bin/` and run `./run.sh`. By default, it will show a small help message if you run it without any flags. Read the message and try again (which also includes a description of all the flags available, can also be invoked with `./run.sh -h`).
    - For your convenience, the `-a` flag enables components related to `ARP`, and `-d` does the same for `DDoS`.
    - The flag `-t` is to run the topology, and the `-c` flag is to run the remote controller for either scenario.
    - Thus, to run the `ARP` topology, run `./run.sh -at`. To run the `DDoS` controller, run `./run.sh -dc`. And so on.
        - Take care to read the prompts, as they will change how the topology and the attacks operate (i.e. if the firewall works, attacks don't work and vice-versa).
    - The `-C` flag is for comments related to the demonstration of a certain attack. Use it with an "attack flag". I.e. `-aC` will show comments for an `ARP` attack. `-dC` for `DDoS`.

This work is not completely original. However, I have ironed out some kinks, and the project is confirmed to be working with `python3.8` as of 2022-03-15.
