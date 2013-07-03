execute "yum -y install php-xml" do
not_if "rpm -qa | grep -q php-xml;"
notifies :restart, "service[apache2]"
end
