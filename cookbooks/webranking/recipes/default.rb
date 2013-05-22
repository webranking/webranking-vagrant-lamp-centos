#
# Cookbook Name:: webranking
# Recipe:: default
#
# Copyright 2013, YOUR_COMPANY_NAME
#
# All rights reserved - Do Not Redistribute
#

execute "service iptables stop" do
end

user "localuser" do
  comment "Local User"
  uid 1000
  gid "apache"
  home "/home/localuser"
  shell "/bin/bash"
  password "local"
end

# channel = "pear.phing.info"
# execute "pear channel-discover #{channel}" do
#   not_if "pear list-channels | grep #{channel}"
# end

# execute "pear install phing/phing" do
#   not_if "pear list -c phing | grep '^phing '"
# end



# XDEBUG


