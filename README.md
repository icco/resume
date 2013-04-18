# Resume

This started as just a simple place to store a markdown format of my resume, and now it's turned into an easy way to host your resume using [sinatra][s], [github-pages][gp] or [Heroku][h].

[gp]: http://pages.github.com/
[h]: http://heroku.com/

## Installation

 1. Fork this project
 2. Modify `resume.md` to be your resume.
 3. Modify `config.yaml` so that the data represents you, not icco.
 4. Edit views/style.less to make your resume look pretty.
 5. Install the gems. The easiest way to do this is `gem install bundler && bundle install`
 6. type `rake local` to run locally.
 7. To deploy to Heroku
   * Run `heroku create`
   * `rake deploy` to push your resume to [heroku][h].
 8. To deploy to [github-pages][gp], run `rake github`.

[g]: http://github.com/schacon/ruby-git
[rt]: http://github.com/brynary/rack-test
[s]: http://www.sinatrarb.com/
[r]: http://github.com/rtomayko/rdiscount
[gm]: http://github.com/github/markup
[md]: http://en.wikipedia.org/wiki/Markdown

## Other cool stuff

My idea is pretty simple, I just wanted a plain text resume and an easy way to host it. [Dan Mayer][dm] took this idea and ran with it. He made a lot of really cool changes, and although I love simplicity, what I really love is how much he abstracted my original design. You should really check out his resume, and some of the forks of it.

[dm]: http://github.com/danmayer/Resume

## License

`resume.md` is property of Nathaniel "Nat" Welch. You are welcome to use it as a base structure for your resume, but don't forget, you are not him.

The rest of the code is licensed CC-GPL. Remember sharing is caring.
