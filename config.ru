require 'sinatra'
require 'rubygems'
require 'bundler'
require 'require_all'

Bundler.require
require_all 'lib'

run RecipeMicroserviceController
