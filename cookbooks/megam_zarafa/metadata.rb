name             "megam_zarafa"
maintainer       "Megam Systems"
maintainer_email "alrin@megam.co.in"
license          "Apache 2.0"
description      "Installs/Configures zarafa"
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          "2.1.0"


%w{ ubuntu debian }.each do |os|
  supports os
end

%w{ openssl database mysql openldap clamav dspam ark}.each do |dep|
  depends dep
end


depends "megam_ganglia"
depends "megam_route53"
depends "megam_deps"
depends "megam_logstash"
depends "megam_gulp"
depends "megam_app_env"
