# config valid only for Capistrano 3
lock '3.6.1'

# Project configuration options
# ------------------------------

set :application,    'shopvegas'
set :login,          'vegasmatras2'
set :user,           'hosting_vegasmatras2'

set :deploy_to,      "/home/#{fetch(:user)}/projects/#{fetch(:application)}"
set :unicorn_conf,   "/etc/unicorn/#{fetch(:application)}.#{fetch(:login)}.rb"
set :unicorn_pid,    "/var/run/unicorn/#{fetch(:user)}/" \
                     "#{fetch(:application)}.#{fetch(:login)}.pid"
set :bundle_without, ['development', 'test'].join(' ') # this is default
set :use_sudo,       false

# set :repo_url,       "#{fetch(:user)}@neon.locum.ru:" \
#                      "git/#{fetch(:application)}.git"

set :repo_url, 'git@bitbucket.org:craft37/widget_shop.git'

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

set :scm, :git
set :format, :pretty
set :pty, true

# Change the verbosity level
set :log_level, :info

# Default value for :linked_files is []
# set :linked_files, %w{config/database.yml}
set :linked_files, fetch(:linked_files, []).push('config/database.yml')

# Default value for linked_dirs is []
set :linked_dirs, ['log', 'tmp/cache', 'vendor/bundle', 'public/system', 'public/attachment', 'public/uploads']

# Default value for keep_releases is 5
set :keep_releases, 3

# Configure RVM
set :rvm_ruby_version, '2.3'

# You unlikely have to change below this line
# -----------------------------------------------------------------------------

# Configure RVM
set :rake,            "rvm use #{fetch(:rvm_ruby_version)} do bundle exec rake"
set :bundle_cmd,      "rvm use #{fetch(:rvm_ruby_version)} do bundle"

set :assets_roles, [:web, :app]

set :unicorn_start_cmd,
    "(cd #{fetch(:deploy_to)}/current; rvm use #{fetch(:rvm_ruby_version)} " \
    "do bundle exec unicorn_rails -Dc #{fetch(:unicorn_conf)})"

# - for unicorn - #
namespace :deploy do
  desc 'Start application'
  task :start do
    on roles(:app) do
      execute unicorn_start_cmd
    end
  end

  desc 'Stop application'
  task :stop do
    on roles(:app) do
      execute "[ -f #{fetch(:unicorn_pid)} ] && " \
              "kill -QUIT `cat #{fetch(:unicorn_pid)}`"
    end
  end

  after :publishing, :restart

  desc 'Restart Application'
  task :restart do
    on roles(:app) do
      execute "[ -f #{fetch(:unicorn_pid)} ] && " \
              "kill -USR2 `cat #{fetch(:unicorn_pid)}` || " \
              "#{fetch(:unicorn_start_cmd)}"
    end
  end
end
