if(node[:omnibus_updater][:disabled])
  Chef::Log.warn 'Omnibus updater disabled via `disabled` attribute'
elsif node[:platform] == "debian" and node[:platform_version].scan("5")
  Chef::Log.warn 'Omnibus updater does not support Debian 5'
else
  include_recipe 'omnibus_updater::downloader'
  include_recipe 'omnibus_updater::installer'
end

if(node[:omnibus_updater][:remove_chef_system_gem])
  include_recipe 'omnibus_updater::remove_chef_system_gem'
end
