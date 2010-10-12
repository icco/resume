# Resume

This started as just a simple place to store a markdown format of my resume,
and now it's turned into an easy way to host your resume using sinatra and
Heroku.

## Installation

 1. Fork this project
 2. Modify resume.md to be your resume.
 3. Install the gems [sinatra][s], [github-markup][gm], and [less][l]
   * each of these has requirements to work correctly, such as [rdiscount][r] for [github-markup][gm]
 4. To deploy to Heroku, also install the heroku gem
   * Run `heroku create`
 5. type `rake` or `./resume.rb` to run locally. 
 6. Edit views/style.less to make your resume look pretty.
 7. `rake deploy` to push your resume to the internet.

[s]: http://www.sinatrarb.com/
[r]: http://github.com/rtomayko/rdiscount
[l]: http://lesscss.org/
[gm]: http://github.com/github/markup

## Other cool stuff

My idea is pretty simple, I just wanted a plain text resume and an easy way to
host it. [Dan Mayer][dm] took this idea and ran with it. He made a lot of
really cool changes, and in although I love simplicity, I really love how much
he abstracted out of my original design. You should really check out his
resume, and some of the forks of it.

[dm]: http://github.com/danmayer/Resume

## License

resume.md is property of Nathaniel "Nat" Welch. You are welcome to use it as a
base structure for your resume, but don't forget, you are not him.

The rest of the code is licensed CC-GPL. Remember sharing is caring.
