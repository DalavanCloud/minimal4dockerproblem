class { 'docker':
  manage_kernel 	=> false,
  socket_bind		=> 'unix:///var/run/docker.sock',
  extra_parameters	=> "-D",
}
