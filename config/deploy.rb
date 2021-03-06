# config valid for current version and patch releases of Capistrano
lock '~> 3.14.0'

set :application, 'hackathon_g2'
set :repo_url, 'git@github.com:wanxiang-blockchain/hackathon2020-T2-Fight.git'

# Default branch is :master
# ask :branch, `git rev-parse --abbrev-ref HEAD`.chomp

# Default deploy_to directory is /var/www/hackathon_g2
# set :deploy_to, "/var/www/hackathon_g2"

# Default value for :format is :airbrussh.
# set :format, :airbrussh

# You can configure the Airbrussh format using :format_options.
# These are the defaults.
# set :format_options, command_output: true, log_file: "log/capistrano.log", color: :auto, truncate: :auto
set :format_options, truncate: false

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
append :linked_files, *%w[puma.rb config/database.yml config/master.key config/secrets.yml db/hackathon_prod.sqlite3 config/credentials.yml.enc]

# Default value for linked_dirs is []
append :linked_dirs, *%w[log tmp/pids tmp/cache tmp/sockets public/system public/packs public/uploads public/news_images node_modules]

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for local_user is ENV['USER']
# set :local_user, -> { `git config user.name`.chomp }

# Default value for keep_releases is 5
# set :keep_releases, 5

# Uncomment the following to require manually verifying the host key before first deploy.
# set :ssh_options, verify_host_key: :secure

set :rbenv_type, :user
set :rbenv_ruby, '2.7.2'

set :puma_init_active_record, true

# https://stackoverflow.com/a/48627238/262826
Rake::Task["deploy:assets:backup_manifest"].clear_actions
