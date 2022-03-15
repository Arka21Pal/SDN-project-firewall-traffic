# Final Topology integrated explanation

- The `final-topo-integrated.py` file contains the `python` code for implementing the current topology with a choice of components and tests.
- This is a continuation from the previous attempts to build a network topology with `python3`.
- For this, we need to import the `TreeTopo`, `Mininet`, `dumpNodeConnections` and `setLogLevel` libraries.
    - [The imports](https://drive.google.com/file/d/18b8yW1MVEOz_C_w9g5mBky480wTFWY53/view?usp=sharing).
- Because this script aims to create a tree topology, we need to first initialise the class `treetopo`, and create a function to build the topology.
    - [Initialisation](https://drive.google.com/file/d/1dynKonDJTlycFAcRoBeaSlLyikLQ4OFJ/view?usp=sharing).
- After that, we take input from the user on how much of depth, fanout and the type of test he wants to run on the topology. These are the defining parameters of the topology, and are essential for the network to function.
    - [Taking input](https://drive.google.com/file/d/1akuOGTtzXvVkSSizVLCSEsCu1fdnEQdE/view?usp=sharing).
- After taking the input for these three parameters, we use Mininet's built-in method to create the topology (with the depth and fanout parameters).
- Following the topology, we give the option of two test, i.e. `ping` and `iperf3` to the user. These tests would generally have to be invoked using a complicated command-line script, but with the help of Python, this process has been automated.
    - [The tree topology and tests](https://drive.google.com/file/d/1_K_uzwchbWyNp4BKT5fQ8ua9todUZRJb/view?usp=sharing).
- A certain level of logging is essential for this script to work, as Mininet keeps tabs on the logs to decide what to do next. The particular line here is `setLogLevel('info')`.
    - [Invoking function and appropriate logging](https://drive.google.com/file/d/1T8bqJ1gyjWjqie1GY17j-Po4ZMbXD6sY/view?usp=sharing).
