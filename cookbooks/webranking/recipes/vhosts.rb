include_recipe "apache2"

vhost_path = "/var/www/vhosts"

directory "#{vhost_path}" do
  mode 00755
  action :create
end

sites = ['furla', 'smeg', 'nutricia', 'greenboxshop'] 

sites.each do |site|

  directory "#{vhost_path}/#{site}" do
    owner "localuser"
    group "apache"
    mode 00755
    action :create
  end

  # FRONTEND

  directory "#{vhost_path}/#{site}/#{site}.local" do
    owner "localuser"
    group "apache"
    mode 00755
    action :create
  end

  directory "#{vhost_path}/#{site}/#{site}.local/logs" do
    owner "root"
    group "root"
    mode 00755
    action :create
  end

  directory "#{vhost_path}/#{site}/#{site}.local/htdocs" do
    owner "localuser"
    group "apache"
    mode 00755
    action :create
  end

  web_app "#{site}" do
    server_name "#{site}.local"
    server_aliases ["www.#{site}.local"]
    doc_root "#{vhost_path}/#{site}/#{site}.local/htdocs"
    vhost_root "#{vhost_path}/#{site}/#{site}.local/"
  end


  # BACKEND
  directory "#{vhost_path}/#{site}/cms.#{site}.local" do
    owner "localuser"
    group "apache"
    mode 00755
    action :create
  end

  directory "#{vhost_path}/#{site}/cms.#{site}.local/logs" do
    owner "root"
    group "root"
    mode 00755
    action :create
  end

  directory "#{vhost_path}/#{site}/cms.#{site}.local/htdocs" do
    owner "localuser"
    group "apache"
    mode 00755
    action :create
  end

  web_app "cms.#{site}" do
    server_name "cms.#{site}.local"
    server_aliases ["cms.#{site}.local"]
    doc_root "#{vhost_path}/#{site}/cms.#{site}.local/htdocs"
    vhost_root "#{vhost_path}/#{site}/cms.#{site}.local/"
  end

end