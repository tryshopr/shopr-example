ruby '2.3.0'

source 'https://rubygems.org'
gem 'rails', '4.2.6'
gem 'bootstrap', '~> 4.0.0.alpha3'
gem 'sprockets-rails', '>= 2.3.3'
gem 'hamlit', '>= 2.2.3'
gem 'hamlit-rails'
gem 'sass-rails', '~> 5.0.4'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.0.0'
gem 'jquery-rails'
gem 'redcarpet'
gem 'faker'
gem 'shoppe', :git => 'git://github.com/tryshoppe/shoppe.git'
gem 'thin'
gem 'better_errors'


group :development do
	gem 'sqlite3'
	gem 'capistrano', '~> 3.5.0'
	gem 'capistrano-bundler', '~> 1.1.2'
	gem 'capistrano-rails', '~> 1.1.1'
	# Add this if you're using rbenv
	# gem 'capistrano-rbenv', github: "capistrano/rbenv"
	# Add this if you're using rvm
	gem 'capistrano-rvm', github: "capistrano/rvm"
	gem 'pry-byebug'
end

group :production do
	gem 'unicorn', '~> 5.1.0'
	gem "mysql2", '~> 0.4.4'
	gem 'rails_12factor'
end