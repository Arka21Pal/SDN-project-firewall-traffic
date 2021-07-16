#!/usr/bin/python

from mininet.topolib import TreeTopo
from mininet.net import Mininet
from mininet.util import dumpNodeConnections
from mininet.log import setLogLevel

class treetopo():
    # initiliasing values
    def __init__(self, d, f):
        self.d=d
        self.f=f

    # Making a Tree Topology
    def build(self):
        return TreeTopo(depth=self.d, fanout=self.f)  

# Take user input 
depth = int(input('\nplease mention the depth of the topo you want to create: '))
fanout = int(input('\nplease mention the fanout of the topo you want to create: '))
test = str(input('\nTo select the test pingAll(), type 1. To select iperf(), type 2: '))

# forming a function with values from the user input into the treetopo class.
a_topo = treetopo(depth, fanout)

def simpleTest():
    # Create and test a simple network
    topo = a_topo.build()
    net = Mininet(topo)
    net.start()
    print( "Dumping host connections" )
    dumpNodeConnections(net.hosts)
    print( "Testing network connectivity" )
    if test == '1':
        net.pingAll()
    elif test == '2':
        net.iperf()
    else:
        print('\nsorry, wrong option')
    # net.pingAll()
    net.stop()

if __name__ == '__main__':
    # Tell mininet to print useful information
    setLogLevel('info')
    simpleTest()
