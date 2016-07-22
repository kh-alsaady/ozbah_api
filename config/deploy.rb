# config valid only for current version of Capistrano
lock '3.5.0'

# lock '3.4.1'
set :application, "ozbah_api_dev"

set :user, "ubuntu"
set :deploy_to, "/var/www/html/#{fetch(:application)}"
#set :deploy_via, :remote_cache
#set :use_sudo, false

set :scm, "git"
set :repo_url, "https://github.com/kh-alsaady/ozbah_api.git"

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push('log', 'tmp/pids', 'tmp/cache', 'tmp/sockets', 'vendor/bundle', 'public/system')

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push('config/database.yml', 'config/secrets.yml')


# Define which type of RVM the server is using
set :rvm_type, :user

# Define ruby version to be used for this application alongwith the gemset
set :rvm_ruby_version, '2.3.0@ozbah_api_dev'


#default_run_options[:pty] = true
#ssh_options[:forward_agent] = true

# keep only the last 5 releases
after :deploy, "deploy:cleanup"
