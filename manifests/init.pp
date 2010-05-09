# syslog-ng
# (copyleft) immerda.ch

class syslog-ng {
    package { 'syslog-ng':
        ensure => present,
        category => $operatingsystem ? {
          gentoo => 'app-admin',
          default => '',
        },
    }
	
	  service { syslog-ng:
        ensure  => running,
        enable  => true,
        require => Package['syslog-ng'],
    }

    file { "/etc/syslog-ng/syslog-ng.conf":
        source => "puppet://$server/modules/syslog-ng/syslog-ng.conf",
        ensure => file,
        force => true,
        mode => 0644, owner => root, group => 0,
        require => Package['syslog-ng'],
	      notify => Service['syslog-ng'],
    }

}
