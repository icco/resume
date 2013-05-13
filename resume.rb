#!/usr/bin/env ruby
#
# An app for displaying one's resume
# @author Nat Welch - https://github.com/icco/resume

# Include our configurations from config.yaml
configure do
  set :config, YAML.load_file('config.yaml')['user_config']
end

# Render the main page.
get '/index.html' do
  rfile = settings.config['file']
  name  = settings.config['name']
  title = "#{name}'s Resume"

  template = Tilt.new(rfile)
  resume = template.render

  erb :index, :locals => {
    :title => title,
    :resume => resume,
    :author => name,
    :key => settings.config['gkey'],
    :filename => rfile
  }
end

# We do this for our static site rendering.
get '/' do
  redirect '/index.html'
end

get '/css/:name.css' do
  filename = params[:name]
  scss filename.to_sym, :views => "#{settings.root}/views/css"
end

# For the plain text version of our resumes
get '/resume.txt' do
  content_type 'text/plain', :charset => 'utf-8'
  File.read(settings.config['file'])
end
