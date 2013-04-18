require 'rubygems' unless defined?(Gem)
require 'bundler/setup'
Bundler.require(:default)

## Just run the application
require './resume'
run Sinatra::Application
