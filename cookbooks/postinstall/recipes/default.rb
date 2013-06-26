#
# Cookbook Name:: postinstall
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#
configurations = data_bag_item("configurations", "configurations")    

log configurations['project'] do
	level :info
end

path = configurations['project']['webserver_root']+configurations['project']['project_name']+'/'+configurations['project']['postfisso_spazi_di_sviluppo_backend']+'/install_greenbox.properties'
template path do
  source "install_greenbox.properties.erb"
  owner "localuser"
  group "apache"
  mode 00644
  variables({
  	:db_host => configurations['project']['db_host'],
 	:db_user => configurations['project']['db_user'],
 	:db_password => configurations['project']['db_password'],
 	:db_name => configurations['project']['db_name'],
 	:project_name => configurations['project']['project_name'],
 	:project_debug_email => configurations['project']['project_debug_email'],
 	:frontend_virtualhost => configurations['project']['frontend_virtualhost'],
 	:frontend_user => configurations['project']['frontend_user'],
 	:backend_virtualhost => configurations['project']['backend_virtualhost'],
 	:backend_user => configurations['project']['backend_user'],
 	:frontend_default_dev_url => configurations['project']['frontend_default_dev_url'],
 	:canali_alias => configurations['project']['canali_alias'],
 	:canali_cartelle => configurations['project']['canali_cartelle'],
 	:postfisso_spazi_di_sviluppo_backend => configurations['project']['postfisso_spazi_di_sviluppo_backen'],
 	:postfisso_spazi_di_sviluppo_frontend => configurations['project']['postfisso_spazi_di_sviluppo_fronten']
  	})
end

execute "phing -l" do
end