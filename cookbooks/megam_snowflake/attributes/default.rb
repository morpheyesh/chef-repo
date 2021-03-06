# Cookbook Name:: snowflake
# Attributes:: snowflake
#Remote Locations

default['snowflake']['mode'] = "0755"

default['snowflake']['id']['conf'] = "/etc/init/uid.conf"
default['snowflake']['conf']['scala'] = "production.scala"
default['snowflake']['id']['script'] = "./usr/local/share/megamsnowflake/bin/start"

default['snowflake']['id']['scala_conf'] = "/usr/local/share/megamsnowflake/config/production.scala"


default['snowflake']['location']['deb'] = "/tmp/megamsnowflake.deb"

#Template file
default['snowflake']['template']['upstart'] = "snowflake.conf.erb"
default['snowflake']['template']['conf'] = "production.scala.erb"

#default['snowflake']['zookeeper'] = "#{node[:ec2][:public_hostname]}"
default['snowflake']['zookeeper'] = "localhost"


#Shell Commands

default['snowflake']['start'] = "start snowflake"

