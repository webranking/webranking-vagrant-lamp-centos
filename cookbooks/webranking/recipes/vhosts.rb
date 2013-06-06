include_recipe "apache2"

vhost_path = "/var/www/vhosts/site"

directory "/var/www/vhosts" do
  mode 00755
  action :create
end

directory "#{vhost_path}" do
  owner "localuser"
  group "apache"
  mode 00755
  action :create
end

# FRONTEND

directory "#{vhost_path}/frontend" do
  owner "localuser"
  group "apache"
  mode 00755
  action :create
end

directory "#{vhost_path}/frontend/logs" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

directory "#{vhost_path}/frontend/htdocs" do
  owner "localuser"
  group "apache"
  mode 00755
  action :create
end

web_app "frontend" do
  server_name "frontend.local"
  server_aliases ["www.frontend.local"]
  doc_root "#{vhost_path}/frontend/htdocs"
  vhost_root "#{vhost_path}/frontend/"
end


# BACKEND
directory "#{vhost_path}/backend" do
  owner "localuser"
  group "apache"
  mode 00755
  action :create
end

directory "#{vhost_path}/backend/logs" do
  owner "root"
  group "root"
  mode 00755
  action :create
end

directory "#{vhost_path}/backend/htdocs" do
  owner "localuser"
  group "apache"
  mode 00755
  action :create
end

web_app "backend" do
  server_name "backend.local"
  server_aliases ["www.backend.local"]
  doc_root "#{vhost_path}/backend/htdocs"
  vhost_root "#{vhost_path}/backend/"
end
