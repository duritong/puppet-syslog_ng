# syslog-ng
# (copyleft) immerda.ch

modules_dir { "syslog-ng": }

class syslog-ng {

        package { 'syslog-ng':
                ensure => present,
                category => $operatingsystem ? {
                        gentoo => 'app-admin',
                        default => '',
                },
        }
	
	service { syslog-ng: ensure  => running, enable  => true, }

	package { metalog:
                name => $operatingsystem ? {
                        centos => 'metalog',
                        default => 'metalog',
                },
                category => $operatingsystem ? {
                        gentoo => 'app-admin',
                        default => '',
                },
                ensure => absent,
                require => Package[syslog-ng],
        }
}

