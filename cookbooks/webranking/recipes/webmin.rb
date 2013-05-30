execute "rpm -U /vagrant/assets/rpms/webmin-1.630-1.noarch.rpm" do
not_if "rpm -qa | grep -q webmin;"
end
