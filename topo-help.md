# LINKS:
- https://www.brianlinkletter.com/2015/04/using-the-pox-sdn-controller/
- https://github.com/mininet/mininet/wiki/Introduction-to-Mininet#creating
- https://stackoverflow.com/questions/37390208/how-to-properly-connect-remote-controller-pox-to-mininet
- http://intronetworks.cs.luc.edu/current/html/mininet.html#openflow-and-the-pox-controller
- https://www.coursera.org/lecture/sdn/customizing-sdn-control-part-1-switching-tlYKf
- https://noxrepo.github.io/pox-doc/html/#invoking-pox

These links should be enough to get the final, integrated script running. We're aiming to utlise the POX controller, because I honestly can't say how much we would need to scale.

## Now, the method:
- Run the POX controller by running `sudo python3 ~/pox/pox/pox.py forwarding.hub` (we're running the hub mechanism right now, but we will transition to the learning_12 mechanism soon)
- Then, in another window, execute the topology. If everything is right (rarely), then the 'ovsk' programmed switches will connect to the POX controller, and the hosts will be able to ping each other.
