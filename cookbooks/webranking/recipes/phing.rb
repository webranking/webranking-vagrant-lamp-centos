channel = "pear.phing.info"
execute "pear channel-discover #{channel}" do
  not_if "pear list-channels | grep #{channel}"
end

execute "pear install /vagrant/assets/pear-local/phing-2.5.0.tgz" do
  not_if "pear list -c phing | grep '^phing '"
end


