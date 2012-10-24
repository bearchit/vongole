set :application, "Vongole"
set :repository, "git@github.com:bearchit/vongole.git"

# set :scm, :subversion
set :scm, :git
# Or: `accurev`, `bzr`, `cvs`, `darcs`, `git`, `mercurial`, `perforce`, `subversion` or `none`

role :web, "vps122.narru.net"                          # Your HTTP server, Apache/etc
role :app, "vps122.narru.net"                          # This may be the same as your `Web` server
role :db,  "vps122.narru.net", :primary => true # This is where Rails migrations will run
# role :db,  "your slave db-server here"


set :user, "deploy"
set :deploy_to, "/home/deploy/apps/vongole"
set :deploy_via, :remote_cache
set :user_sudo, false

default_run_options[:pty] = true
ssh_options[:forward_agent] = true

after "deploy", "deploy:cleanup"

namespace :deploy do
  %w[start stop restart].each do |command|
    desc "#{command} unicorn server"
    task command, roles: :app, except: {no_release: true} do 
      run "/etc/init.d/unicorn_#{application} #{command}"
    end
  end

  task :setup_config, roles: :app do
    sudo "ln -nfs #{current_path}/config/nginx.conf /etc/nginx/sites-enabled/#{application}"
    sudo "ln -nfs #{current_path}/config/unicorn_init.sh /etc/init.d/unicorn_#{application}"
    run "mkdir -p #{shared_path}/config"
    put File.read("config/mongoid.example.yml"), "#{shared_path}/config/mongoid.yml"
    puts "Now edit the config file in #{shared_path}"
  end
  after "deploy:setup", "deploy:setup_config"

  task :symlink_config, roles: :app do
    run "ln -nfs #{shared_path}/config/mongoid.yml #{release_path}/config/mongoid.yml"
  end
  after "deploy:finalize_update", "deploy:symlink_config"

  desc "Make sure local git is in sync with remote."
  task :check_revision, roles: :web do
    unless `git rev-parse HEAD` == `git rev-parse origin/master`
      puts "WARNING: HEAD is not the same as origin master"
      puts "Run 'git push' to sync changes."
      exit
    end
  end
  before "deploy", "deploy:check_revision"
  
end
