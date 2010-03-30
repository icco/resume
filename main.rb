#!/usr/bin/ruby1.8
# An app for displaying one's resume

require 'rubygems'
require 'sinatra'
require 'less'
require 'rdiscount'

get '/' do
   RDiscount.new(File.read("resume.md"), :smart).to_html
end

get '/style.css' do
   content_type 'text/css', :charset => 'utf-8'
   less :style
end

