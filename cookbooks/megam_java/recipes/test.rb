packager 'explicit' do
  action :remove
end

package 'with_attributes' do
  version '1.0.0'
  action  :remove
end

package 'specifying the identity attribute' do
  package_name 'identity_attribute'
  action       :remove
end
