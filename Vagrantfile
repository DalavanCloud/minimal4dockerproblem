$shellsetup = <<SHELLSCRIPT
sudo apt-get update
sudo apt-get install -qq puppet
# Avoid warning from initial puppet run
test -r /etc/puppet/hiera.yaml || sudo touch /etc/puppet/hiera.yaml
# Fix for https://stackoverflow.com/questions/37892435/cant-install-puppet-modules-302-found-win-8-1-64-running-ubuntu-trusty-64-i
sed -i -e '/\[main\]/a module_repository=https://forge.puppet.com' /etc/puppet/puppet.conf
# Install some puppet modules
test -r /etc/puppet/modules/stdlib || sudo puppet module install puppetlabs-stdlib
test -r /etc/puppet/modules/docker || sudo puppet module install garethr-docker
SHELLSCRIPT

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/trusty64"
  config.vm.hostname = "minimal4docker"
  config.vm.provider "virtualbox" do |config|
    config.name = "minimal4docker"
  end

  config.vm.provision "shell", inline: $shellsetup
  config.vm.provision "puppet", manifest_file: "init.pp",
                      working_directory: "/vagrant", manifests_path: "."
  config.vm.provision "shell", path: "test.sh"
end
