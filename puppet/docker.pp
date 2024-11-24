class nginx docker {

#Ensure Docker is installed
 package { 'docker.io':
  ensure => installed,
}

#Ensure Docker service is started and enabled
service { ‘docker':
    ensure => running,
    enable => true,
    require => Package['docker.io’],
}

# Create directory for Nginx website under /srv
file { ‘/srv/nginx-website':
  ensure => directory,
}

# Copy HTML file to the target directory with the updated content
file { ‘/srv/nginx-website/index.html':
  ensure => file,
  content => '<h1>We came to the end of the project!<br>Wish you had fun ^_^</h1>',
  require => File['/srv/nginx-website'],
}

# Copy Dockerfile to the target directory
file { ‘/srv/nginx-website/dockerfile':
  ensure => file,
  source => 'puppet:///modules/nginx_docker/dockerfile',
  require => File['/srv/nginx-website'],
}

# Remove the container if it exists (to avoid name conflicts)
exec { ‘remove_existing_nginx_container':
    command => '/usr/bin/docker rm -f my-nginx-container’,
    onlyif        => '/usr/bin/docker ps -a | grep my-nginx-container', 
    path         => ['/usr/bin', '/bin'],
}

# Build Docker image using the Dockerfile 
exec { 'build_nginx_image':
    command => ‘/usr/bin/docker build -t my-nginx-image /srv/nginx-website',
    path         => ['/usr/bin', '/usr/local/bin'],
    logoutput => true,
    require => File['/srv/nginx-website/dockerfile'],
}

#Run Docker container
exec { ‘run_nginx_container’:
    command => ‘/usr/bin/docker run -d -p 8081:80 --name my-nginx-container my-nginx-image’,
  path          => ['/usr/bin', '/usr/local/bin'],
require        => Exec['build_nginx_image"],
}

}

