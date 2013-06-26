configurations = data_bag_item("configurations", "all");

Vagrant.configure("2") do |config|
	config.vm.synced_folder "J:/Greenbox/01-Greenbox/sviluppo/", configurations["local_greenbox_repository_mount"]
	config.vm.synced_folder "J:/Nutricia-Danone/00-Progetto1/sviluppo/03 SVN", configurations["local_project_repository_mount"]
end


# log configurations['svn_repository'] do
# 	level :info
# end