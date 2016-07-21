set :branch, "dev"
set :application, "ozbah_api_dev"
set :deploy_to, "/var/www/html/#{fetch(:application)}"

server '52.42.50.168',
  user: 'ubuntu',
  roles: %w{web app db},
  ssh_options: {
    user: 'ubuntu', # overrides user setting above
    keys: %w(~/.ssh/id_rsa),
    forward_agent: false,
    auth_methods: %w(publickey)
    # password: 'please use keys'
  }

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command do
      on roles(:app), in: :sequence, wait: 1 do
        # execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
        execute "/etc/init.d/unicorn_#{fetch(:application)} #{command}"        
      end
    	# on roles :app, except: {no_release: true} do
    	# 	run "/etc/init.d/unicorn_#{fetch(:application)} #{command}"
    	# end
    end
  end

  desc 'setup config'
  task :setup_config do
  	on  roles :app do
      # configure nginx on the server
	    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-available/#{fetch(:application)}"
      sudo "ln -nfs /etc/nginx/sites-available/#{fetch(:application)} /etc/nginx/sites-enabled/#{fetch(:application)}"
      #Configure unicorn on the server
	    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{fetch(:application)}"
	    #run "mkdir -p #{shared_path}/config"
	    # put File.read("config/database.example.yml"), "#{shared_path}/config/database.yml"
	    puts "Now edit the config files in #{shared_path}."
	  end
  end

  task :symlink_config do
  	on roles :app do
    	sudo "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
      sudo "ln -nfs #{shared_path}/config/secrets.yml #{release_path}/config/secrets.yml"
    end
  end

  # desc "Make sure local git is in sync with remote."

  # task :check_revision do
  #   on roles :web do
	 #    unless `git rev-parse HEAD` == `git rev-parse origin/dev`
	 #      puts "WARNING: HEAD is not the same as origin/dev"
	 #      puts "Run `git push` to sync changes."
	 #      exit
	 #    end
	 #  end
  # end

end

# ========== Callbacks =========== #
after :deploy, "deploy:restart"
# after  :deploy, "deploy:setup_config"
# after  :deploy, "deploy:symlink_config"
# before :deploy, "deploy:check_revision"
# before 'deploy:symlink:linked_files', "deploy:symlink_config"
