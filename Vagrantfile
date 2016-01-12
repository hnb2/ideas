# -*- mode: ruby -*-
# vi: set ft=ruby :
VAGRANTFILE_API_VERSION = "2"
Vagrant.configure(VAGRANTFILE_API_VERSION) do |config|
  config.vm.box = "https://cloud-images.ubuntu.com/vagrant/trusty/current/trusty-server-cloudimg-amd64-vagrant-disk1.box"
  config.ssh.insert_key = false
  config.vm.provider :virtualbox do |v|
    v.name = "ideas"
    v.memory = 1024
    v.cpus = 2
    v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
    v.customize ["modifyvm", :id, "--ioapic", "on"]
  end
  config.vm.hostname = "ideas"
  config.vm.network :private_network, ip: "192.168.33.10"
  config.vm.network "forwarded_port", guest: 8000, host: 8000
  # Set the name of the VM. See: http://stackoverflow.com/a/17864388/100134
  config.vm.define :ideas do |ideas|
  end
  # Ansible provisioner.
  config.vm.provision "ansible" do |ansible|
    ansible.playbook = "provisioning/playbook.yml"
    ansible.inventory_path = "provisioning/inventory"
    ansible.sudo = true
  end
end
