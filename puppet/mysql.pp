class mysql {


#Ensure the MySQL server package is installed
package { 'mysql-server':
    Ensure => installed,
}

#Ensure the MySQL service is running and enabled at boot
service  { ‘mysql’:
    ensure => running,
    enable => true,
    require => Package ['mysql-server'],
}

#Set MySQL root password (if not already set)
exec  { 'set_mysql_root_password":
    command  => ‘/usr/bin/mysqladmin -u root password "newpassword"’,
    unless       => ‘/usr/bin/mysql -u root -p"newpassword" -e "SHOW DATABASES:"’,
    path          => ['/usr/bin', '/bin'],
    require      => Package['mysql-server’],
}

# Create a MySQL database if it doesn't exist
exec { 'create database':
    command =>’ /usr/bin/mysql -u root -p"newpassword" -e "CREATE DATABASE my database”’,
    unless      => ‘/usr/bin/mysql -u root -p"newpassword" -e "SHOW DATABASES LIKE \'ny_database\’”’,
    path         => ['/usr/bin', '/bin'],
    require     => Exec['set_mysql_root_password'],
}

#Create a cron job for daily MySQL backups
cron { 'mysql_backup':
   command =>’ /usr/bin/mysqldump -u root -p"newpassword" my_database > /var/backups/my_database_$(date +\).sql',
   minute      => ‘0’,
   hour          => '2',
   require => Exec['create_database'],
}

}
