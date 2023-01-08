# Define variables
Publish=hugo
SHELLCHECK=shellcheck

build: ## Builds a new website
	$(Publish)

clean: ## Remove all files from folder dist
	rm -r dist/*

post: ## Create new post and using the sed command to modify the contents of a file.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"
	
integration-tests: ## server and check the localhost
	hugo
	ls dist/
	
unit-tests: ## Runs different makefile recipes
	make POST_TITLE='TEST' POST_NAME='this-is-a-test' post
	make build
	make clean

validate: ## Tests dir
	pwd
		
help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1
