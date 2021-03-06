default[:ganglia][:version] = "3.1.7"
default[:ganglia][:uri] = "http://downloads.sourceforge.net/project/ganglia/ganglia%20monitoring%20core/3.1.7/ganglia-3.1.7.tar.gz?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fganglia%2Ffiles%2Fganglia%2520monitoring%2520core%2F3.1.7%2F&ts=1397215464&use_mirror=kaz"
default[:ganglia][:checksum] = "bb1a4953"
default[:ganglia][:grid_name] = "megampaas"
default[:ganglia][:cluster_name] = "megampaas"
default[:ganglia][:unicast] = true
default[:ganglia][:server_role] = "162.248.141.53"
default[:ganglia][:user] = "nobody"
default[:ganglia][:rrd_rootdir] = "/var/lib/ganglia/rrds"
default[:ganglia][:gmetad][:xml_port] = 8651
default[:ganglia][:gmetad][:interactive_port] = 8652
default[:gagnlia][:spoof_hostname] = true

default[:ganglia][:hostname] = "#{node.name}"
default[:ganglia][:ip] = "#{`wget http://ipecho.net/plain -O - -q ; echo`}"

# port assignments for each cluster
# you should overwrite this with your own cluster list in a wrapper cookbook.
# Notes:
# * don't use port 8649
# * don't put spaces in cluster names
default[:ganglia][:clusterport] = {
                                    "megampaas"       => 18649
                                  }
#default['ganglia']['clusterport']['default'] = 18649
# this is set on the host to determine which cluster it should join
# it's a hash with one key per cluster; it should join all clusters
# that have a value of 1.  If a machine is part of two clusters,
# it will show up in both. If this isn't overridden in the role,
# it'll show up in the default cluster.
default[:ganglia][:host_cluster] = {"megampaas" => 1}

# attributes relevant to rrdcached
default[:ganglia][:enable_rrdcached] = true
# what user should rrdcached run as?
# this should be the same as the user running gmetad
default[:ganglia][:rrdcached][:user] = node[:ganglia][:user]
# use this socket for gmetad
default[:ganglia][:rrdcached][:main_socket] = "/tmp/rrdcached.sock"
# use this socket for the web ui
default[:ganglia][:rrdcached][:limited_socket] = "/tmp/rrdacached_limited.sock"
# where do the ganglia rrds live
default[:ganglia][:rrdcached][:ganglia_rrds] = node[:ganglia][:rrd_rootdir]

# attributes for web configuration
# whether to use authentication: options 'disabled', 'readonly', and 'enabled'
default[:ganglia][:web][:auth_system] = 'disabled'

# run two gmetads on the web server; one handles writing rrds and the other
# serves interactive queries from the web ui. Set this to true if you have >300k metrics
default[:ganglia][:enable_two_gmetads] = false
default[:ganglia][:two_gmetads][:xml_port] = 8661
default[:ganglia][:two_gmetads][:interactive_port] = 8662
default[:ganglia][:two_gmetads][:empty_rrd_rootdir] = "/var/lib/ganglia/empty-rrds-dir"
