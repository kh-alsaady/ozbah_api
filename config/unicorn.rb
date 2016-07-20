root = "/var/www/html/ozbah_api_dev/current"
working_directory root
pid "#{root}/tmp/pids/unicorn.pid"
stderr_path "#{root}/log/unicorn.log"
stdout_path "#{root}/log/unicorn.log"

listen "/tmp/unicorn.ozbah_api_dev.sock"
worker_processes 2
timeout 30
# Don't forget to Apply this command for unicorn_init.sh file on the server
# chmod +x config/unicorn_init.sh
