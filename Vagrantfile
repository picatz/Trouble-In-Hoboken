# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # The most common configuration options are documented and commented below.
  # For a complete reference, please see the online documentation at
  # https://docs.vagrantup.com.

  # Every Vagrant development environment requires a box. You can search for
  # boxes at https://atlas.hashicorp.com/search.
  config.vm.box = "debian/jessie64"

  # Disable automatic box update checking. If you disable this, then
  # boxes will only be checked for updates when the user runs
  # `vagrant box outdated`. This is not recommended.
  #config.vm.box_check_update = true

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network "forwarded_port", guest: 4567, host: 4567

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  # config.vm.network "private_network", ip: "192.168.33.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network "public_network"

  # Share an additional folder to the guest VM. The first argument is
  # the path on the host to the actual folder. The second argument is
  # the path on the guest to mount the folder. And the optional third
  # argument is a set of non-required options.
  # config.vm.synced_folder "../data", "/vagrant_data"

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
   config.vm.provider "virtualbox" do |vb|
  #   # Display the VirtualBox GUI when booting the machine
  #   vb.gui = true
  #
  #   # Customize the amount of memory on the VM:
     vb.memory = "1600"
   end
  #
  # View the documentation for the provider you are using for more
  # information on available options.

  # Define a Vagrant Push strategy for pushing to Atlas. Other push strategies
  # such as FTP and Heroku are also available. See the documentation at
  # https://docs.vagrantup.com/v2/push/atlas.html for more information.
  # config.push.define "atlas" do |push|
  #   push.app = "YOUR_ATLAS_USERNAME/YOUR_APPLICATION_NAME"
  # end

  # Enable provisioning with a shell script. Additional provisioners such as
  # Puppet, Chef, Ansible, Salt, and Docker are also available. Please see the
  # documentation for more information about their specific syntax and use.
   config.vm.provision "shell", inline: <<-SHELL
     sudo su root
     apt-get update -y
     apt-get upgrade -y
     #apt-get install mysql-client mysql-server libmysqlclient-dev -y
     sudo apt-get install -y vim git tmux htop nethogs curl tree -y
     # get RVM, Ruby Setup with Required Gems
     gpg2 --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
     curl -L https://get.rvm.io | bash -s stable --ruby
     echo "source /usr/local/rvm/scripts/rvm" >> ~/.bashrc
     source ~/.bash_profile
     echo "syntax on" >> ~/.vimrc
     echo "set number" >> ~/.vimrc
     echo "set tabstop=2" >> ~/.vimrc
     echo "set softtabstop=2" >> ~/.vimrc
     echo "set shiftround" >> ~/.vimrc
     echo "set shiftwidth=2" >> ~/.vimrc
     echo "set expandtab" >> ~/.vimrc
     #gem install sinatra mysql colorize thin
     # get custom mysql server scripts
     curl https://raw.githubusercontent.com/picatz/Ruby-Research-SQL-Security/master/MySQL%20Database%20and%20Table/info_mysql_server.rb >> mysql_server_info.rb
     curl https://github.com/picatz/Ruby-Research-SQL-Security/blob/master/MySQL%20Database%20and%20Table/make_db_and_table_assigment.rb >> mysql_build_data.rb
     # run them
     #ruby mysql_server_info.rb
     #ruby mysql_build_data.rb
     echo "I like cats." 
   SHELL
end
