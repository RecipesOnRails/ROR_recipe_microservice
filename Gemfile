source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'puma', '~> 3.11'
gem 'figaro', git: 'https://github.com/bpaquet/figaro.git', branch: 'sinatra'
gem 'faraday'
gem 'sinatra'
gem 'travis'

group :development, :test do
  gem 'rspec'
  gem 'rubocop'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
end

group :test do
  gem 'simplecov'
end

gem 'tzinfo-data'
