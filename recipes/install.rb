username       = node[:owner_name]
git_ssh_prefix = node[:git_ssh_prefix]

directory "/home/#{username}/config" do
  owner owner_name
  group owner_name
  mode "0755"
  recursive true
  action :create
end

directory "/home/#{username}/bin" do
  owner owner_name
  group owner_name
  mode "0755"
  recursive true
  action :create
end

template "/home/#{username}/config/#{git_ssh_name}-ssh-config" do
  mode 0600
  owner owner_name
  source "ssh-config.erb"
  variables({
    :app_name => app
  })
end

template "/home/#{username}/bin/#{git_ssh_name}-ssh" do
  mode 0755
  owner owner_name
  source "git-ssh.erb"
  variables({
    :ssh_config_file => ["/home/#{username}/config/#{git_ssh_name}-ssh-config"]
  })
end

template "/home/#{username}/bin/#{git_ssh_name}" do
  mode 0755
  owner owner_name
  source "git.erb"
  variables({
    :git_ssh_file => ["/home/#{username}/bin/#{git_ssh_name}-ssh"]
  })
end

