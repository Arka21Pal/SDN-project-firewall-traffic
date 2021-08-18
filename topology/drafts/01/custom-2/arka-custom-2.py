# https://stackoverflow.com/questions/55363742/mininet-how-to-make-communicating-two-host-between-two-switches

def networkTest():

    net = Mininet( topo=None,
               build=False )


    s1 = net.addHost('s1', cls=Node)
    s2 = net.addHost('s2', cls=Node)

    h1 = net.addHost('h1', cls=Host, mac='00:00:10:10:00:01')
    h2 = net.addHost('h2', cls=Host, mac='00:00:10:10:00:02')

    Link(s1, h1, intfName1='s1-eth0')
    Link(s2, h2, intfName1='s2-eth0')
    Link(s1, s2, intfName1='s1-eth1')

    net.build()

    for controller in net.controllers:
        controller.start()

    h1.cmd('ip addr add 10.10.0.1/24 dev h1-eth0')
    h1.cmd('ip link set h1-eth0 up')

    h2.cmd('ip addr add 10.10.0.2/24 dev h2-eth0')
    h2.cmd('ip link set h2-eth0 up')

    s1.cmd('brctl addbr br0')
    s1.cmd('brctl addif br0 s1-eth0')
    s1.cmd('brctl addif br0 s1-eth1')
    s1.cmd('ip link set br0 up')

    s2.cmd('brctl addbr br1')
    s2.cmd('brctl addif br1 s2-eth0')
    s2.cmd('ip link set br1 up')

    CLI(net)
    net.stop()