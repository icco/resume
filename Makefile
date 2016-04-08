all: local

local:
	middleman

deploy:
	git push
	middleman deploy
