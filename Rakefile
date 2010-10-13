task :default => [:build]

task :build do
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

desc "deploy to user.github.com/Resume"
task :github do
   require 'resume'
   require 'rubygems'
   require 'git'
   require 'rack/test'
   require 'logger'

   remote = YAML.load_file('config.yaml')['github']['remote']

   browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))

   # Get index.html
   browser.get '/'
   html = browser.last_response.body

   # get style.css
   browser.get '/style.css'
   css = browser.last_response.body

   root = "/tmp/checkout-#{Time.now.to_i}"
   g = Git.clone(remote, root, :log => Logger.new(STDOUT))

   # Make sure this actually switches branches.
   g.checkout(g.branch('gh-pages'))

   # Write and commit
   File.open("#{root}/index.html", 'w') {|f| f.write(html) }
   File.open("#{root}/style.css", 'w') {|f| f.write(css) }

   g.add('index.html');
   g.add('style.css');
   g.commit('updating github page')

   # PUSH!
   g.push(g.remote('origin'), g.branch('gh-pages'))

   puts '--> Commit and Push successful.'
end


