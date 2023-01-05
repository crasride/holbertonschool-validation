build: ## Builds a new website
	hugo

post: ## Create new post and using the sed command to modify the contents of a file change to the ENV value.
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from folder dist
	rm -rf dist/*

lint: ## Lints shellcheck script
	shellcheck setup.sh

unit-tests: ## Unit testing
	pwd

integration-tests: ## Start the server and check the url localhost
	ls -la

help: ## isplay the list of targets and their usage
	cat Makefile | grep '##' | tr -d '##' | head -n -1
