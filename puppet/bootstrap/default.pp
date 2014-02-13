package { 'librarian-puppet':
    ensure   => 'installed',
    provider => 'gem',
}

file { "/etc/puppet":
    ensure => "directory",
}