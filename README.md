# Resume

This started as just a simple place to store a markdown format of my resume,
and now it's turned into an easy way to host your resume using sinatra and
Heroku.

## Installation

 1. Fork this project
 2. Install the gems sinatra ( >= 1.0), rdiscount, erubis, and less
 3. To deploy to Heroku, also install the heroku gem
   * Run "heroku create"
 4. type "rake" or ./main.rb to run locally. 
 5. Edit views/style.less to make your resume look pretty.
 6. "rake deploy" to push your resume to the internet.

## License

resume.md is property of Nathaniel "Nat" Welch. You are welcome to use it as a
base structure for your resume, but don't forget, you are not him.

The rest of the code is licensed CC-GPL. Remember sharing is caring.
