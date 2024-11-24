class webserver {


#Ensure Apache package is installed
package { 'apache2':
Ensure => installed,
}
# Ensure Apache service is running and enabled at boot
service { ‘apache2':
ensure => running,
enable => true,
require => Package['apache2"], #Make sure the package is installed before starting the service
}

#Ensure the /var/www/html directory exists with correct permissions for Apache (www-data) file {‘ /var/www/html':
  ensure => 'directory',
  owner  => 'www-data',
  group   => ‘www-data',
  mode   => '0755',
  require Package['apache2']  # Ensure Apache is installed before managing the directory
}

#Ensure the index.html file exists with the desired content
file { ‘/var/www/html/index.html':
  ensure   => 'file',
  content  => '<h1>It\'s us again but from Puppet this time!</h1>',
  owner    => 'www-data", Apache serves files as www-data, so the file should be owned by www-data
  group     => 'www-data',
  mode     => '0644',
  require   => File['/var/www/html'], # Ensure the /var/www/html directory exists first
}

}


