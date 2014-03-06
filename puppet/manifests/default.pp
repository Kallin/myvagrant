file { 'motdfile':
    path => '/etc/motd',
    content => "This Learning Puppet VM's IP address is ${ipaddress}. 
It thinks its hostname is ${fqdn}, but you might not be able to reach it there from your host machine. 
It is running ${operatingsystem} ${operatingsystemrelease} and Puppet ${puppetversion}."
}

package { 'tmux': ensure => "present" }
package { 'curl': ensure => "present" }
package { 'vim': ensure => "present" }

exec { "apt-update":
    command => "/usr/bin/apt-get update"
}

# ensure our package manager is up to date before grabbing any packages
Exec["apt-update"] -> Package <| |>


file { '/home/vagrant':
	source => "/vagrant/puppet/dotfiles",
	recurse => "true",
	before => Exec['lesskey'],
}

exec { 'lesskey': 
	path => ['/usr/bin', '/bin', '/sbin'],
	user => 'vagrant',
	environment => ["HOME=/home/vagrant"]
}

include ohmyzsh
ohmyzsh::install { 'vagrant': }

 