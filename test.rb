ENV['RACK_ENV'] = 'test'
require 'minitest/autorun'
require 'minitest/pride'
require 'rack/test'
require 'pry'
require_relative 'recipe_service'

include Rack::Test::Methods

def app
  Sinatra::Application
end

describe 'recipe_service' do
  it 'should return "Hello World"' do
    get '/'

    assert_equal(last_response.headers['Content-Type'], "application/json")

    payload = JSON.parse(last_response.body, symbolize_names: true)

    assert_equal(payload[:message], "Hello World!")
  end
end
