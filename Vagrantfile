# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'yaml'

current_dir    = File.dirname(File.expand_path(__FILE__))
configs        = YAML.load_file("#{current_dir}/config.yaml")
vagrant_config = configs['configs'][configs['configs']['use']]

Vagrant.configure("2") do |config|
  
	config.vm.box = "ubuntu/trusty64"
   
	config.vm.network "private_network", :ip => vagrant_config['vm_ip'] , :name => 'VirtualBox Host-Only Ethernet Adapter', :adapter => 2
  
	config.vm.provider "virtualbox" do |v|
		v.memory = vagrant_config['vm_mem']
		v.cpus = vagrant_config['vm_cpu']
	end
   
	config.vm.provision :shell  do |s|
		s.path = "proxy.sh"
		s.args = [vagrant_config['proxy']]
	end
	
	config.vm.provision :shell  do |h|
	   h.path = "init.sh"
	   h.args = [vagrant_config['proxy']]
	end
end
