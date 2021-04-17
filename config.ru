require 'sinatra'
require 'rubygems'
require 'bundler'
require 'require_all'
require 'figaro/sinatra'

Bundler.require

run RecipeMicroserviceController
