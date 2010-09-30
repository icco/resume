#!/usr/bin/env ruby
# An app for displaying one's resume

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'

get '/' do
   title = "Nathaniel Welch's Resume"
   resume = RDiscount.new(File.read("resume.md"), :smart).to_html
   erubis :index, :locals => { :title => title, :resume => resume }
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

