source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'json'
gem 'rspec'

gem 'figaro', git: 'https://github.com/bpaquet/figaro.git', branch: 'sinatra'
gem 'faraday'
gem 'sinatra'
gem 'travis'
gem 'rubocop'
gem 'simplecov'
gem 'require_all'
gem 'dotenv'

group :development, :test do
  gem 'pry'
end

group :test do
  gem 'rack-test'
  gem 'rake'
  gem 'webmock'
  gem 'vcr'
end
