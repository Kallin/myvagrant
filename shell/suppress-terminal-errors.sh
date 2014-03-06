#!/bin/sh

# suppressing ubuntu terminal errors; https://github.com/mitchellh/vagrant/issues/1673  
sed -i 's/^mesg n$/tty -s \&\& mesg n/g' /root/.profile
# bash -c 'BASH_ENV=/etc/profile exec bash'