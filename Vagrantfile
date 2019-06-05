# -*- mode: ruby -*-
# vi: set ft=ruby :

Vagrant.configure(2) do |config|
  config.vm.box = "ubuntu/bionic64" # used as it has cifs-utils installed

  config.vm.box_check_update = false
  config.vbguest.auto_update = false

  if Vagrant.has_plugin?("vagrant-proxyconf")
    config.proxy.http     = "http://10.0.2.2:3128/" # 10.0.2.2 is your machine's IP address, from VirtualBox's perspective 
    config.proxy.https    = "http://10.0.2.2:3128/" 
    config.proxy.no_proxy = "localhost,127.0.0.1,10.0.2.2,10.0.2.15,192.168.99.,.local,minikube-registry" 
  end

  config.vm.define vm_name = "ubuntu" do |d|
    d.vm.provider "virtualbox" do |v|
      v.name = vm_name
      v.memory = 4096
      v.customize ["modifyvm", :id, "--natdnshostresolver1", "on"]
      v.customize ["modifyvm", :id, "--natdnsproxy1", "on"]
      v.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vagrant", "1"] # support symlinks in mounts
    end
    $machineName = "ubuntu"
    d.vm.hostname = $machineName 
	
    d.vm.synced_folder "C:/git", "/git"

    d.ssh.insert_key = false

    d.vm.provision :docker
    d.vm.provision :shell, path: "post_install.sh"
  end    
  config.vm.network "forwarded_port", guest: 8443, host: 8443
  config.vm.network "forwarded_port", guest: 8200, host: 8200
end
