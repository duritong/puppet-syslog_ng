class syslog_ng::base {
  package { 'syslog-ng':
    ensure => present,
  }
	
  file { "/etc/syslog-ng/syslog-ng.conf":
    source => "puppet:///modules/syslog-ng/syslog-ng.conf",
    ensure => file,
    force => true,
    mode => 0644, owner => root, group => 0,
    require => Package['syslog-ng'],
	  notify => Service['syslog-ng'],
  }

	service { syslog-ng:
    ensure  => running,
    enable  => true,
    require => Package['syslog-ng'],
  }
}
