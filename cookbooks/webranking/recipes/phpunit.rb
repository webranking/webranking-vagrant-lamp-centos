package "php-xml" do
  action :install
end

# phpunit/PHPUnit depends on symfony/YAML
channels = %w{pear.phpunit.de pear.symfony.com}
channels.each do |chan|
  php_pear_channel chan do
    action :discover
    # action [:discover, :update]
  end
end

# php_pear "PHPUnit" do
#   channel "phpunit"
#   # only_if "phpunit --version > /dev/null 2>&1 || { echo >&2 'not installed'; }"
#   action :install
# end

execute "pear install /vagrant/assets/pear-local/Yaml-2.2.1.tgz" do
  not_if "pear list -c pear.symfony.com | grep -q '^Yaml '"
end


execute "pear install PHPUnit-3.7.21.tgz" do
  not_if "phpunit --version > /dev/null 2>&1 || { echo >&2 'not installed'; }"
end
