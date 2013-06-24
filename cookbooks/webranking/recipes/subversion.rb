
subversion "greenboxshop.local" do
  repository "http://vm0374.cs05.seeweb.it/repos/greenboxshop.frontend/trunk"
  revision "HEAD"
  destination "/var/www/vhosts/greenboxshop/greenboxshop.local"
  svn_username "gianluca.crema"
  svn_password "crema"
  user "localuser"
  group "apache"
  action :sync
end
