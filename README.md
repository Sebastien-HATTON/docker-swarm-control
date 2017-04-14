# Overview
This project is a showcase of how to use the new Docker Swarm mode, driving it through Docker Compose.

# Prerequisites

* [Vagrant](https://www.vagrantup.com/) installed and working
* [VirtualBox](https://www.virtualbox.org/) installed and working
* [VirtualBox Extension Pack](https://www.virtualbox.org/wiki/Downloads) installed into VirtualBox
* **[Virtualization support](https://en.wikipedia.org/wiki/X86_virtualization) enabled in your BIOS**
* a working internet connection
* Your corporate VPN running (if you want to apply some work-specific plays)

# Building
All the components of the environment live in repositories on the internet so there is nothing to build.

# Installation
1. `vagrant ssh node-1` -- all commands are done from the master node
1. `scripts/01-create-swarm.sh` -- you will have to enter the password for each ssh session
1. `scripts/02-create-overlay-network.sh` -- creates the overlay network that the containers will use
1. `scripts/03-deploy-global-service.sh` -- creates a service where one instance runs on all nodes

# Tips and Tricks
TODO

# Troubleshooting
TODO

# License and Credits
This project is licensed under the [Apache License Version 2.0, January 2004](http://www.apache.org/licenses/).
