#
# Cookbook:: tomcat
# Recipe:: default
#
# Copyright:: 2018, The Authors, All Rights Reserved.

package "java"
package "java-devel"
execute 'tomcat' do
 command '/usr/bin/wget http://www-us.apache.org/dist/tomcat/tomcat-7/v7.0.88/bin/apache-tomcat-7.0.88.tar.gz'
 action :run
end
execute 'tomcat_chown' do
command 'chown -R ravikumarreddy_bld:ravikumarreddy_bld apache-tomcat-7.0.88.tar.gz'
action :run
end
execute 'tomcat_install' do
command '/usr/bin/tar xvfz apache-tomcat-7.0.88.tar.gz -C /home/ravikumarreddy_bld'
 action :run
end
execute 'rmove_tomcat' do
command 'rm -rf /home/ravikumarreddy_bld/apache-tomcat-7.0.88/conf/tomcat-users.xml'
action :run
end
file '/home/ravikumarreddy_bld/apache-tomcat-7.0.88/conf/tomcat-users.xml' do
content '<tomcat-users>
<role rolename="manager-gui"/>
<user username="tomcat" password="tomcat" roles="manager-gui"/>
</tomcat-users>'
end
execute 'tomcat_chown' do
command 'chown -R ravikumarreddy_bld:ravikumarreddy_bld /home/satishk/apache-tomcat-7.0.88'
action :run
end
execute 'tomcat_run' do
command '/home/ravikumarreddy_bld/apache-tomcat-7.0.88/bin/startup.sh'
action :run
end
