# BLOG MAKEFILE
# https://nickgerace.dev

RUBY_VERSION:=2.7.1

run:
	/usr/bin/env bundle exec jekyll serve --host 127.0.0.1

upstream:
	git remote add upstream https://github.com/rohanchandra/type-theme.git
	git pull upstream

one-install-rbenv:
	if type apt &> /dev/null; then sudo apt install -y git gcc libssl-dev libreadline-dev zlib1g-dev build-essential; fi
	if [ ! -d $(HOME)/.rbenv ]; then git clone https://github.com/rbenv/rbenv.git $(HOME)/.rbenv; fi
	if [ ! -d $(HOME)/.rbenv/plugins/ruby-build ]; then git clone https://github.com/rbenv/ruby-build.git $(HOME)/.rbenv/plugins/ruby-build; fi
	@printf "\nReload shell.\n\n"

two-setup-rbenv:
	rbenv install $(RUBY_VERSION)
	rbenv global $(RUBY_VERSION)
	@printf "\nReload shell.\n\n"

three-install-jekyll:
	gem install jekyll bundler
	bundle install --verbose
	@printf "\nReload shell.\n\n"
