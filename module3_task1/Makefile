build: ## Builds a new website
	hugo

post: ## Create new post and using the sed command to modify the contents of a file change to the ENV value.
	hugo new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

clean: ## Remove all files from folder dist
	rm dist/*

lint: ## Lints the yaml file and shell
	shellcheck setup.sh >/dev/null 2>&1 || echo "Lint Failed"
	yamllint ./github-workflow.yml --no-warnings >/dev/null 2>&1 && echo OK
	yq eval '.jobs.*.steps.[].name' ./github-workflow.yml | wc -l
	yq eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make lint' && echo OK
	yq eval '.jobs.*.steps.[].run' ./github-workflow.yml | grep -q 'make integration-test'

integration-tests: ## Start the server and check the url localhost
	hugo
	ls dist/

help: ## isplay the list of targets and their usage
	cat Makefile | grep '##' | tr -d '##' | head -n -1
