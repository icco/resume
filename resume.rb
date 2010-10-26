#!/usr/bin/env ruby
# An app for displaying one's resume

require "rubygems"
require "sinatra"
require "less"
require "github/markup"
require "yaml"

configure do
   set :config, YAML.load_file('config.yaml')['user_config']
end

get '/' do
   rfile = settings.config['file']
   name  = settings.config['name']
   title = "#{name}'s Resume"
   resume = GitHub::Markup.render(rfile, File.read(rfile))
   erb :index, :locals => { 
      :title => title, 
      :resume => resume,
      :author => name,
      :filename => rfile
   }
end

get '/resume.txt' do
   content_type 'text/plain', :charset => 'utf-8'
   File.read(settings.config['file'])
end


get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

get '/print.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :print
end

