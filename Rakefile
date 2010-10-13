task :default => [:build]

task :build do
   exec('./resume.rb')
end

desc "Deploy to Heroku."
task :deploy do
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
   require 'git'
   require 'resume'
   require 'test/unit'
   require 'rack/test'

   browser = Rack::Test::Session.new(Rack::MockSession.new(Sinatra::Application))

   # Get index.html
   browser.get '/'
   html = browser.last_response.body

   # get style.css
   browser.get '/style.css'
   css = browser.last_response.body

   root = '/tmp/checkout/'
   g = Git.clone('.', :path => root)
   g.branch('gh-pages')
   File.open("#{root}index.html", 'w') {|f| p f; f.write(doc) }
   File.open("#{root}style.css", 'w') {|f| f.write(doc) }
   g.commit_all('updating github page')
   g.push
end


