# import /home/happy/mininet/mininet as mininet

from mininet.cli import CLI
from mininet.log import setLogLevel
from mininet.net import Mininet
from mininet.topo import Topo
from mininet.node import RemoteController, OVSSwitch

class MyTopo( Topo ):
    "Minimal topology with a single switch and two hosts"

    def build( self ):
       
        # Create two hosts.
        h1 = self.addHost( 'h1' )
        h2 = self.addHost( 'h2' )
        h3 = self.addHost( 'h3' )
        h4 = self.addHost( 'h4' )
       
        # Create switches
        s1 = self.addSwitch( 's1' )
        s2 = self.addSwitch( 's2' )

        # Add links between each switch and the respective hosts
        self.addLink( s1, h1 )
        self.addLink( s1, h2 )
        self.addLink( s2, h3 )
        self.addLink( s2, h4 )

        # Add a link between the switches
        self.addLink( s1, s2 )

def runMyTopo():
    "Bootstrap a Mininet network using the Minimal Topology"

    # Create an instance of our topology
    topo = MyTopo()

    # Create a network based on the topology using OVS and controlled by
    # a remote controller.
    net = Mininet(
        topo=topo,
        controller=lambda name: RemoteController(RemoteController, ip='127.0.0.1'),
        switch=OVSSwitch,
        autoSetMacs=True )

    # Actually start the network
    net.start()

    
    def simpleTest():
        "Create and test a simple network"
        print( "Dumping host connections" )
        dumpNodeConnections(net.hosts)
        print( "Testing network connectivity" )
        pingAll()
        net.iperf()

    simpleTest()

    # Drop the user in to a CLI so user can run commands.
    # CLI( net )

    # After the user exits the CLI, shutdown the network.
    net.stop()

if __name__ == '__main__':
    # This runs if this file is executed directly
    setLogLevel( 'info' )
    runMyTopo()

# Allows the file to be imported using `mn --custom <filename> --topo minimal`
topos = {
    'mytopo': MyTopo
}
