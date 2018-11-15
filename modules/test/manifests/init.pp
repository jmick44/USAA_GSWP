class test (
  $user = 'silkysmooth',
  $group = $test::params::group,
  $message = 'This is the default message',
) inherits test::params {

  user { $user:
    ensure => present,
  }

  group { $group:
    ensure => present,
  }

  file { 'C:\Windows\Temp\mydir':
    ensure => directory,
    before => File['C:\Windows\Temp\mydir\testfile.txt'],
  }

  file { 'C:\Windows\Temp\mydir\testfile.txt':
    ensure => file,
    #content => 'Puppet rocks!!!!!',
    content => epp('test/testfile.txt.epp', message => $message),
  }

  notify { "My message is: ${message}": 
    require => File['C:\Windows\Temp\mydir\testfile.txt'],
  }

}
