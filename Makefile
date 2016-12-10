all: local

local:
	middleman

deploy:
	git push
	bundle exec middleman deploy
	git co master
