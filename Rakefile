task :default => [:github, :deploy]

desc "Run your resume locally."
task :local do
   exec('./resume.rb')
end

desc "Deploy to Heroku."
task :deploy do
   require 'rubygems'
   require 'heroku'
   require 'heroku/command'
   user, pass = File.read(File.expand_path("~/.heroku/credentials")).split("\n")
   heroku = Heroku::Client.new(user, pass)

   cmd = Heroku::Command::BaseWithApp.new([])
   remotes = cmd.git_remotes(File.dirname(__FILE__) + "/../..")

   remote, app = remotes.detect {|key, value| value == (ENV['APP'] || cmd.app)}

   if remote.nil?
      raise "Could not find a git remote for the '#{ENV['APP']}' app"
   end

   `git push #{remote} master`

   heroku.restart(app)
end

# TODO: Make this dynamically figure out all of the files needed
desc "Deploy to remote defined in config.yaml"
task :github do
   require 'resume'
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

