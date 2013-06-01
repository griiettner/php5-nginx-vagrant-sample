execute "apt-get" do
  command "apt-get update"
end
package "nginx"
package "php5"
package "php5-cli"
package "php5-fpm"
package "mysql-server"

template "/etc/nginx/conf.d/php-fpm.conf" do
  source "php-fpm.conf.erb"
end

service "mysqld" do
  action :start
end

service "php-fpm" do
  action :start
end

service "nginx" do
  action :start
end