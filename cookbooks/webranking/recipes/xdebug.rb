include_recipe "php"

# install xdebug apache module
php_pear "xdebug" do
  version node['xdebug']['version']
  action :install
end

# copy over xdebug.ini to node
template "#{node['php']['ext_conf_dir']}/xdebug.ini" do
  source "xdebug.ini.erb"
  owner "root"
  group "root"
  mode 0644
  # TODO: Move logic from template to recipe later?
  # variable( :extension_dir => node['php']['php_extension_dir'] )
  notifies :restart, resources("service[apache2]"), :delayed
end