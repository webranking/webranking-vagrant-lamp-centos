execute "rpm -ivh http://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/6/$(uname -m)/epel-release-6-8.noarch.rpm" do
not_if "rpm -qa | grep -q epel;"
end

execute "yum -y install php-mcrypt" do
not_if "rpm -qa | grep -q php-mcrypt;"
notifies :restart, "service[apache2]"
end
