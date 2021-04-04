MAKEPATH:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

serve:
	cd $(MAKEPATH); bundle exec jekyll serve \
		--future --livereload --host 127.0.0.1

update:
	cd $(MAKEPATH); bundle install
	cd $(MAKEPATH); bundle update

setup:
	ruby --version
	@printf "[+] Ruby is installed!\n"
	gem install jekyll bundler
	cd $(MAKEPATH); bundle install
