# BLOG MAKEFILE
# https://nickgerace.dev

help:
	@printf "Recommended targets...\n  make run\n  make upstream\n  make setup-for-mac\n  make setup-for-deb\n"

run:
	/usr/bin/env bundle exec jekyll serve --host 127.0.0.1

upstream:
	git remote add upstream https://github.com/rohanchandra/type-theme.git
	git pull upstream

setup-for-mac: deps-mac deps-else

setup-for-deb: deps-deb deps-else

deps-mac:
	brew install ruby

deps-deb:
	sudo apt install ruby-full -y

deps-else:
	gem install jekyll bundler
	bundle install --verbose
