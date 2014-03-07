# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "ubuntu-1310"
  
  config.vm.hostname = "vagrant.example.com"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://puppet-vagrant-boxes.puppetlabs.com/ubuntu-1310-x64-virtualbox-puppet.box"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/bootstrap"
  end

  config.vm.provision :shell, :path => "shell/setup-librarian-puppet.sh"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
  end

  config.vm.provider "virtualbox" do |v|
      v.memory = 1024
  end

end
