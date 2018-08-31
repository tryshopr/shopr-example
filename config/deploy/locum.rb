role :app, ['hosting_vegasmatras2@neon.locum.ru']
role :web, ['hosting_vegasmatras2@neon.locum.ru']
role :db, ['hosting_vegasmatras2@neon.locum.ru']

set :ssh_options, forward_agent: true
set :rails_env, :production
