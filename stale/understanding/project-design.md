# Project design

## Introduction

This project is built on the premise that, with how complex the architecture is of SDN, a pluggable and portable firewall is of the utmost importance. In SDN, the controller is the brain of the network. Thus, it is only natural to expect that every attack on an SDN system, will either directly or indirectly, target the controller.

By design, the SDN controller is susceptible to many network attacks, some of which are quite common in the traditional networking domain. In this project, we started with research on how to build a network topology, taking into account the nuances of creating a project on a virtual infrastructure. Mininet provides an end-to-end emulation of the network, thus allowing to test most, if not all variations of traffic flow, encapsulating attacks, countermeasures and general traffic flow.

Manipulating traffic has always been a core tenet of the SDN philosophy, which aims to bring the best out of both existing and new hardware. Opportunities to optimise existing methods to engage with the network, have propelled SDN to greater heights,but have also exposed the framework to new dangers.

## Problem Statement

The aim of this project is to attempt to build a modular firewall system, which can defend against specified attacks with pluggable modules. This is meant to be a simple implementation of a firewall, with no frills and no extras packaged with the main system.

## Flowchart

[This](https://drive.google.com/file/d/1hick7KSNajuRe5CCO0T0U-Ac_CDb61qQ/view) is the flowchart.

## Explanation of flowchart (workflow)

In this project, we first begin by installing Mininet. Some of our members are using Mininet as a virtual machine on their personal workstations, whilst one is utilising the cloud to host a self-built Mininet instance. This also highlights another feature of working with a virtual infrastructure: portability. Our choice to use Mininet was in consideration of the need to be able to use our project, with minimal refactoring, on other systems too. We utilise python to write our network scripts and invoke the intelligent SDN controllers bundled in with the software, alongside Mininet.

After realising the scope of Mininet, we embarked upon building the tests that would signify a working and cohesive network. As of now, the tests being used are a `ping` test and an `iperf3` test, both for testing if the network is functioning normally and the hosts are able to communicate amongst each other. The `ping` test evaluates the network reachability across the entire network, whilst the `iperf3` test checks the network throughput between hosts, and by extension, examines the load-bearing capacity of the controller and the switches involved in the path of the considerable data flow invoked by the utility.

With this as our starting point, we discovered that it was possible to create truly massive networks with, simply, an orchestrated sequence of commands. After realising how to invoke Mininet's inbuilt-functions with `python3`, we began writing a script to build a network topology with appropriate user input, but minimal user intervention. Utilising a tree topology (which currently also supports the more manual, linear approach, but is slated to be deprecated as the project matures), this `python3` script lets an user with the necessary privileges to create a network topology in Mininet, and then run the tests of his choice on them.

## Image representing the network (PT)


