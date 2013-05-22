package "php-xml" do
  action :install
end

# phpunit/PHPUnit depends on symfony/YAML
channels = %w{pear.phpunit.de}
channels.each do |chan|
  php_pear_channel chan do
    action :discover
    # action [:discover, :update]
  end
end

php_pear "PHPUnit" do
  channel "phpunit"
  # only_if "phpunit --version > /dev/null 2>&1 || { echo >&2 'not installed'; }"
  action :install
end

# execute "pear install phpunit/PHPUnit" do
#   only_if "phpunit --version > /dev/null 2>&1 || { echo >&2 'not installed'; }"
# end
