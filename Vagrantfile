Vagrant.configure("2") do |config|

    # Enable the Puppet provisioner, with will look in manifests
    config.vm.provision :puppet do |puppet|
        puppet.manifests_path = "puppet/manifests"
        puppet.manifest_file = "default.pp"
        puppet.module_path = "puppet/modules"
    end

    # Every Vagrant virtual environment requires a box to build off of.
    config.vm.box = "hashicorp/precise32"

    # Forward guest port 80 to host port 8888 and name mapping
    config.vm.network "private_network", ip: "192.168.50.3"

    config.vm.synced_folder "web/", "/vagrant/web/", owner: "www-data", group: "www-data"
    config.vm.synced_folder "database/", "/vagrant/database/", :owner => "vagrant"

    config.vm.provider "virtualbox" do |v|
      v.memory = 512
    end

    config.vm.provision "shell",
        inline: "echo Box up and provisioned"
end
