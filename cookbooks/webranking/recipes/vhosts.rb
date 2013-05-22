include_recipe "apache2"

directory "/vagrant/site1" do
  owner "root"
  group "root"
  mode 00644
  action :create
end

directory "/vagrant/site1/logs" do
  owner "root"
  group "root"
  mode 00644
  action :create
end

directory "/vagrant/site1/htdocs" do
  owner "localuser"
  group "apache"
  mode 00644
  action :create
end

web_app "site1" do
  server_name "site1.local"
  server_aliases ["www.site1.local"]
  doc_root "/vagrant/site1/htdocs"
  vhost_root "/vagrant/site1"
end