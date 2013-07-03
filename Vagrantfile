# -*- mode: ruby -*-
# vi: set ft=ruby :
require 'json'

# import json with project configs
configurations = JSON.parse(File.read(Pathname(__FILE__).dirname.join('data_bags/configurations/', 'default.json')))

Vagrant.configure("2") do |config|
  # All Vagrant configuration is done here. The most common configuration
  # options are documented and commented below. For a complete reference,
  # please see the online documentation at vagrantup.com.

  # Every Vagrant virtual environment requires a box to build off of.
  config.vm.box = "centos"

  # The url from where the 'config.vm.box' box will be fetched if it
  # doesn't already exist on the user's system.
  # config.vm.box_url = "http://developer.nrel.gov/downloads/vagrant-boxes/CentOS-6.4-x86_64-v20130309.box"

  config.vm.hostname = 'server.name'

  # Create a forwarded port mapping which allows access to a specific port
  # within the machine from a port on the host machine. In the example below,
  # accessing "localhost:8080" will access port 80 on the guest machine.
  config.vm.network :forwarded_port, guest: 80, host: 8080

  # Create a private network, which allows host-only access to the machine
  # using a specific IP.
  config.vm.network :private_network, ip: "192.168.10.10"

  # Create a public network, which generally matched to bridged network.
  # Bridged networks make the machine appear as another physical device on
  # your network.
  # config.vm.network :public_network

  # Provider-specific configuration so you can fine-tune various
  # backing providers for Vagrant. These expose provider-specific options.
  # Example for VirtualBox:
  #
  # config.vm.provider :virtualbox do |vb|
  #   # Don't boot with headless mode
  #   vb.gui = true
  #
  #   # Use VBoxManage to customize the VM. For example to change memory:
  #   vb.customize ["modifyvm", :id, "--memory", "1024"]
  # end
  #
  # View the documentation for the provider you're using for more
  # information on available options.

  # Enable provisioning with Puppet stand alone.  Puppet manifests
  # are contained in a directory path relative to this Vagrantfile.
  # You will need to create the manifests directory and a manifest in
  # the file base.pp in the manifests_path directory.
  #
  # An example Puppet manifest to provision the message of the day:
  #
  # # group { "puppet":
  # #   ensure => "present",
  # # }
  # #
  # # File { owner => 0, group => 0, mode => 0644 }
  # #
  # # file { '/etc/motd':
  # #   content => "Welcome to your Vagrant-built virtual machine!
  # #               Managed by Puppet.\n"
  # # }
  #
  # config.vm.provision :puppet do |puppet|
  #   puppet.manifests_path = "manifests"
  #   puppet.manifest_file  = "init.pp"
  # end

  # Enable provisioning with chef solo, specifying a cookbooks path, roles
  # path, and data_bags path (all relative to this Vagrantfile), and adding
  # some recipes and/or roles.
  #
  # config.vm.provision :shell, :path => "networking.sh"

  config.vm.provision :chef_solo do |chef|

    chef.data_bags_path = "data_bags"
    chef.json = {
        "mysql" => {
        # "server_root_password" => "admin",
        # "server_repl_password" => "admin",
        # "server_debian_password" => "admin"        
        "server_root_password" => configurations['database']['server_root_password'],
        "server_repl_password" => configurations['database']['server_repl_password'],
        "server_debian_password" => configurations['database']['server_debian_password']
        },
        "apache" => {
            "listen_address" => "0.0.0.0",
            # "server_name" => "localhost",
        },
        'php' => {
            'version' => '5.3',
            'directives' => {
                'date.timezone' => 'Europe/Rome'
            }
        },
        "fqdn" => "vagrant.local",
        "samba" => {
            "hosts_allow" => 'ALL'
        }
        # ,
        # "configs" => {
        #     "local_link_to_svn" => "/svn_nutricia"
        # }
    }
    chef.add_recipe "yum"
    chef.add_recipe "selinux::disabled"
    chef.add_recipe "xml"
    chef.add_recipe "vim"
    # chef.add_recipe "openssl"
    chef.add_recipe "apache2"
    chef.add_recipe "mysql"
    # chef.add_recipe "mysql::server"
    chef.add_recipe "php"
    # chef.add_recipe "php::module_apc"
    chef.add_recipe "php::module_curl"
    chef.add_recipe "php::module_mysql"
    chef.add_recipe "apache2::mod_php5"
    chef.add_recipe "apache2::mod_rewrite"
    chef.add_recipe "php::module_mcrypt"
    chef.add_recipe "php::module_domxml"
    chef.add_recipe "php::module_gd"
    chef.add_recipe "webranking"
    chef.add_recipe "webranking::vhosts"
    chef.add_recipe "samba"
    chef.add_recipe "samba::server"
    # chef.add_recipe "webranking::xdebug"
    chef.add_recipe "webranking::phing"
    # chef.add_recipe "webranking::phpunit"
    chef.add_recipe "webranking::webmin"
    chef.add_recipe "webranking::samba"
    chef.add_recipe "webranking::svn1-7"
    chef.add_recipe "postinstall"
    # chef.add_recipe "webranking::subversion"
    # chef.add_recipe "webranking::configurations"
  end


  if configurations['svn'].include?('local_project_repository_mount') 
    config.vm.synced_folder configurations['svn']['local_project_source'], configurations['svn']['local_project_repository_mount']
  end

  # config.vm.synced_folder "J:/Nutricia-Danone/00-Progetto1/sviluppo/03 SVN", "/svn_nutricia"
  
  # config.vm.synced_folder "./site/frontend", "/var/www/vhosts/site/frontend", :owner=> 'vagrant', :group=>'apache', :extra => 'dmode=755,fmode=755'
  # config.vm.synced_folder "./site/backend", "/var/www/vhosts/site/backend", :owner=> 'vagrant', :group=>'apache', :extra => 'dmode=755,fmode=755'


  # config.vm.provision :chef_solo do |chef|
  #   chef.cookbooks_path = "../my-recipes/cookbooks"
  #   chef.roles_path = "../my-recipes/roles"
  #   chef.data_bags_path = "../my-recipes/data_bags"
  #   chef.add_recipe "mysql"
  #   chef.add_role "web"
  #
  #   # You may also specify custom JSON attributes:
  #   chef.json = { :mysql_password => "foo" }
  # end

  # Enable provisioning with chef server, specifying the chef server URL,
  # and the path to the validation key (relative to this Vagrantfile).
  #
  # The Opscode Platform uses HTTPS. Substitute your organization for
  # ORGNAME in the URL and validation key.
  #
  # If you have your own Chef Server, use the appropriate URL, which may be
  # HTTP instead of HTTPS depending on your configuration. Also change the
  # validation key to validation.pem.
  #
  # config.vm.provision :chef_client do |chef|
  #   chef.chef_server_url = "https://api.opscode.com/organizations/ORGNAME"
  #   chef.validation_key_path = "ORGNAME-validator.pem"
  # end
  #
  # If you're using the Opscode platform, your validator client is
  # ORGNAME-validator, replacing ORGNAME with your organization name.
  #
  # If you have your own Chef Server, the default validation client name is
  # chef-validator, unless you changed the configuration.
  #
  #   chef.validation_client_name = "ORGNAME-validator"
end
