# vim:filetype=ruby

provision_script = <<-EOB
export DEBIAN_FRONTEND=noninteractive

set -e
set -x

wget -q -O - https://get.docker.io/gpg | apt-key add -
echo deb http://get.docker.io/ubuntu docker main > /etc/apt/sources.list.d/docker.list

apt-get update -yq
apt-get install -yq git-all curl make
apt-get install -yq --force-yes lxc-docker

apt-get update -yq
apt-get install -yq linux-image-generic-lts-raring

usermod -a -G docker vagrant

shutdown -r +1
EOB

Vagrant.configure('2') do |config|
  config.vm.hostname = 'modcloth-docker-layers'
  config.vm.box = 'precise64'
  config.vm.box_url = 'http://cloud-images.ubuntu.com/vagrant/precise/current/precise-server-cloudimg-amd64-vagrant-disk1.box'

  config.vm.network :private_network, ip: '33.33.33.10', auto_correct: true

  # forward docker ports
  (49000..49900).each do |port|
    config.vm.network :forwarded_port, host: port, guest: port
  end

  config.vm.provision :shell, inline: provision_script
end
