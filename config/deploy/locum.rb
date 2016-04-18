role :app, %w(hosting_vegasmatras2@neon.locum.ru)
role :web, %w(hosting_vegasmatras2@neon.locum.ru)
role :db, %w(hosting_vegasmatras2@neon.locum.ru)

set :ssh_options, forward_agent: true
set :rails_env, :production
