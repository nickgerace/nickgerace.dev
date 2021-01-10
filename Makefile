MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

serve:
	cd $(MAKEPATH); bundle exec jekyll serve --livereload --host 127.0.0.1

update:
	cd $(MAKEPATH); bundle install
	cd $(MAKEPATH); bundle update

minutes:
	cd $(MAKEPATH); python3 minutes.py

setup:
ifeq ($(shell uname), Darwin)
	brew install ruby
else
    sudo apt install ruby-full -y
endif
	gem install jekyll bundler
	cd $(MAKEPATH); bundle install
