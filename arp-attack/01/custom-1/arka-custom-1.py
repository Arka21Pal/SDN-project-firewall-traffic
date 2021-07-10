# This was originally a custom topology, directly from mininet. I'm editing it, to play around with the basics for now.

from mininet.topo import Topo

class MyTopo(Topo): # defining a simple topology
    def build(self):

        # Add hosts

        Host1 = self.addHost('h1')
        Host2 = self.addHost('h2')
        Host3 = self.addHost('h3')
        Host4 = self.addHost('h4')
        Host5 = self.addHost('h5')
        Host6 = self.addHost('h6')
        Host7 = self.addHost('h7')
        Host8 = self.addHost('h8')
        Host9 = self.addHost('h9')

        # Add switches

        Switch1 = self.addSwitch('s1')
        Switch2 = self.addSwitch('s2')
        Switch3 = self.addSwitch('s3')
        Switch4 = self.addSwitch('s4')

        # Link devices

        self.addLink(Host1, Switch1)
        self.addLink(Host2, Switch1)
        self.addLink(Switch1, Switch2)
        self.addLink(Host3, Switch2)
        self.addLink(Host4, Switch2)
        self.addLink(Switch2, Switch3)
        self.addLink(Host5, Switch3)
        self.addLink(Host6, Switch3)
        self.addLink(Switch3, Switch4)
        self.addLink(Host7, Switch4)
        self.addLink(Host8, Switch4)
        self.addLink(Host9, Switch4)
        self.addLink(Switch4, Switch1)

        self.addLink(Switch1, Switch3)
        self.addLink(Switch2, Switch4)

topos = {'mytopo':(lambda: MyTopo())}

#############################################

# """Custom topology example

# Two directly connected switches plus a host for each switch:

#    host --- switch --- switch --- host

# Adding the 'topos' dict with a key/value pair to generate our newly defined
# topology enables one to pass in '--topo=mytopo' from the command line.
# """

# from mininet.topo import Topo

# class MyTopo( Topo ):
#     "Simple topology example."

#     def build( self ):
#         "Create custom topo."

#         # Add hosts and switches
#         leftHost = self.addHost( 'h1' )
#         rightHost = self.addHost( 'h2' )
#         leftSwitch = self.addSwitch( 's3' )
#         rightSwitch = self.addSwitch( 's4' )

#         # Add links
#         self.addLink( leftHost, leftSwitch )
#         self.addLink( leftSwitch, rightSwitch )
#         self.addLink( rightSwitch, rightHost )


# topos = { 'mytopo': ( lambda: MyTopo() ) }
