source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.4.1'

gem 'rails', '~> 5.2.2'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'bootsnap', '>= 1.1.0', require: false
gem 'faraday'
gem 'figaro'
gem 'fast_jsonapi'
gem 'bcrypt', '~> 3.1.7'
gem 'rack-cors', require: 'rack/cors'


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'capybara'
  gem 'launchy'
  gem 'shoulda-matchers'
  gem 'pry'
  gem 'awesome_print'
  gem 'simplecov'
  gem 'webmock'
  gem 'vcr'
  gem 'database_cleaner'
  gem 'factory_bot'

end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
end


gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
