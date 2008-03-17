# syslog-ng
# (copyleft) immerda.ch

#modules_dir { "syslog-ng": }

class syslog-ng {

        package { 'syslog-ng':
                ensure => present,
                category => $operatingsystem ? {
                        gentoo => 'app-admin',
                        default => '',
                },
        }
	
	service { syslog-ng: ensure  => running, enable  => true, }

    file { "/etc/syslog-ng/syslog-ng.conf":
        source => "puppet://$servername/syslog-ng/syslog-ng.conf",
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0,
        require => Package['syslog-ng'],
    }

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

