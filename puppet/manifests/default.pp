# default path
Exec {
  path => ["/usr/bin", "/bin", "/usr/sbin", "/sbin", "/usr/local/bin", "/usr/local/sbin"]
}

$domain = "devsite.loc"

include bootstrap
include tools
include apache
include php
include mysql

