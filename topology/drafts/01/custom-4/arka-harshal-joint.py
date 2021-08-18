# Trying a basic topology from harshal.py

from mininet.topo import Topo

class MyTopo( Topo ):
    "Simple topology example."

    def build( self ):
        "Create custom topo."

        # Add hosts and switches
        h1 = self.addHost( 'h1' )
        h2 = self.addHost( 'h2' )
        h3 = self.addHost( 'h3' )
        s1 = self.addSwitch( 's1' )
        s2 = self.addSwitch( 's2' )
        s3 = self.addSwitch( 's3' )

        # Add links between hosts and switches

        self.addLink(h1, s1)
        self.addLink(h2, s2)
        self.addLink(h3, s3)
        
        # Add links between switches

        self.addLink(s1, s2)
        self.addLink(s2, s3)
        self.addLink(s3, s1)

topos = { 'mytopo': ( lambda: MyTopo() ) }
