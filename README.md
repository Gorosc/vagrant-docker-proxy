# vagrant-docker-proxy

Info:
The VM bootstraps to the Virtualbox Host-Only network. If you wish to attach it to an external network  modify config.vm.network accordingly in the Vagrantfile.
f.e.
config.vm.network "public_network" , :mac => "0800270F3A36"

Instructions:
Modify config.yaml to the preferences you want and execute a  vagrant up
