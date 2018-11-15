class test::params {

  if $::kernel == 'windows' {
    $group = 'windows_group'
  }
  elsif $::kernel == 'linux' {
    $group = 'linux_group'
  }
  else {
    fail("Unsupported Kernel: ${::kernel}")
  }
}
