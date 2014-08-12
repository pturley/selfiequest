exec { 'apt-update':
  command => "/usr/bin/apt-get update",
  onlyif => "/bin/bash -c 'exit $(( $(( $(date +%s) - $(stat -c %Y /var/lib/apt/lists/$( ls /var/lib/apt/lists/ -tr1|tail -1 )) )) <= 604800 ))'"
}

Exec["apt-update"] -> Package <| |>

package { ["libpq-dev", "sqlite3", "libsqlite3-dev"]: ensure => present }

class { 'rbenv':
  install_dir => '/opt/rbenv',
  latest      => true
}

rbenv::plugin { 'sstephenson/ruby-build': }
rbenv::build { '2.1.1': global => true }

file { "/home/vagrant/bundle" :
  ensure => directory,
  owner => "vagrant",
  group => "vagrant"
}

class { 'postgresql::server':
  postgres_password => 'password',
}