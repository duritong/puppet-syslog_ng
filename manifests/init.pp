class syslog_ng {
  case $::operatingsystem {
    gentoo: { include syslog_ng::gentoo }
    default: { include syslog_ng::base }
  }
}
