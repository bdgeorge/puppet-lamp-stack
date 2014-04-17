class php {

  # package install list
  $packages = [
    "libapache2-mod-fastcgi",
    "php5-fpm",
    "php5",
    "php5-cli",
    "php5-mysql",
    "php-pear",
    "php5-dev",
    "php5-gd",
    "php5-mcrypt",
    "php5-xdebug",
  ]

  package { $packages:
    ensure => present,
    require => Exec["apt-get update"]
  }

  # create php-fpm config from main vagrant manifests
  file { "/etc/php5/fpm/pool.d/www.conf":
    ensure => present,
    content => template('php/fpm/pool.d/www.conf.erb'),
    require => Package["php5-fpm"],
  }

  # tell apache to use php5-fpm for .php requests
  file { "/etc/apache2/conf.d/php5-fpm.conf":
    ensure => present,
    content => template('php/apache/conf.d/php5-fpm.conf.erb'),
    require => Package["php5-fpm", "apache2"],
  }

  # All the extensions are loaded in the wrong folder, so link it to the right one
  # TODO: This needs to happen before any of the packages are added

  file { "/etc/php5/mods-available":
    ensure => link,
    target => "/etc/php5/conf.d",
    require => Package["php5"]
  }
}
