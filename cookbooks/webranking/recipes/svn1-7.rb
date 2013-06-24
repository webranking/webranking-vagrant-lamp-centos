execute "rpm -U /vagrant/assets/rpms/subversion-1.7.4-0.1.el6.rfx.x86_64.rpm" do
not_if "rpm -qa | grep -q subversion;"
end
