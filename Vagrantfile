# -*- mode: ruby -*-
# vi: set ft=ruby :

# Vagrantfile API/syntax version. Don't touch unless you know what you're doing!
VAGRANTFILE_API_VERSION = "2"

Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "precise32"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  config.vm.box_url = "http://files.vagrantup.com/"

  config.vm.provision :shell, :path => "shell/suppress-terminal-errors.sh"
  config.vm.provision :shell, :path => "shell/dpkg-reconfigure.sh"

  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/bootstrap"
  end

  config.vm.provision :shell, :path => "shell/setup-librarian-puppet.sh"
  
  config.vm.provision "puppet" do |puppet|
    puppet.manifests_path = "puppet/manifests"
  end

  config.vm.network "forwarded_port", guest: 80, host: 3000

end
