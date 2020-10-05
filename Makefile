# BLOG MAKEFILE
# https://nickgerace.dev

MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

help:
	@printf "Recommended targets...\n  make run\n  make minutes\n make upstream\n  make setup-for-mac\n  make setup-for-deb\n"

run:
	/usr/bin/env bundle exec jekyll serve --host 127.0.0.1

# We change directory to the repository's root instead of using the full path to the script because
# we want to remove any potential edge cases during runtimne.
minutes:
	@cd $(MAKEPATH); python3 minutes.py

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
