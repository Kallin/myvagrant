package { 'ruby-dev':
	ensure   => 'installed',
	before => Package['librarian-puppet'],
}

package { 'librarian-puppet':
    ensure   => 'installed',
    provider => 'gem',
}

file { "/etc/puppet":
    ensure => "directory",
}