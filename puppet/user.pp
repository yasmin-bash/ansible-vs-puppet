class user {

#create a user named 'student' with the hashed password 
user { 'student':
  ensure	=> present,
  managehome    => true,
  shell         => '/bin/bash',
  password      => '$6$MnEC8y5BrT1XsS1T$sn.2mtA0pymGtMSQB6/BXJwagkeE5cR1EvrsIe4ZMYO7udnbwW0C.IFuqwSfq3CyLK1jBC78GsJ1oFdr1EGH51',  #Hahed password
 }

#ensure the user can log in after reboot
file { '/etc/sudoers.d/student':
  ensure  => present,
  content => 'student ALL=(ALL) NOPASSWD:ALLL',
  mode    => '0440'
}

#configure SSH to allow password authentication 
augeas { 'sshd config_password_auth':
  context =>'/files/etc/ssh/sshd_config',
  changes =>[
    'set PasswordAuthentication yes',
],
  notify  =>Service['ssh'], #Restart SSH if this setting changes
}

#ensure SSH service is running and restart if config changes 
service {'ssh':
  ensure  => running,
  enable  => true,
}

}
