task :default => [:github, :heroku]

desc "Run your resume locally."
task :local do
   exec('./resume.rb')
end

desc "Deploy to Heroku."
task :heroku do
   #`git push heroku master`

   puts "Currently this is broken.\n"
end

# TODO: Make this dynamically figure out all of the files needed
desc "Deploy to remote defined in config.yaml"
task :github do
   require File.expand_path('../resume',__FILE__)
   require 'rubygems'
   require 'git'
   require 'rack/test'
   require 'logger'

   remote = YAML.load_file('config.yaml')['github']['remote']

   browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))

   files = [
      '/index.html',
      '/print.css',
      '/style.css',
      '/resume.txt',
      '/favicon.ico'
   ]

   root = "/tmp/checkout-#{Time.now.to_i}"
   g = Git.clone(remote, root, :log => Logger.new(STDOUT))

   # Make sure this actually switches branches.
   g.checkout(g.branch('gh-pages'))

   files.each {|file|
      browser.get file
      content = browser.last_response.body
      File.open("#{root}#{file}", 'w') {|f| f.write(content) }
      g.add(File.basename(file))
   }

   g.commit('Regenerating Github Pages.')

   # PUSH!
   g.push(g.remote('origin'), g.branch('gh-pages'))

   puts '--> Commit and Push successful.'
end

