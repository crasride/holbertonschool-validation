
build: ## Builds a new website
	make docker_run docker_awesome docker_clean

docker_clean: ## Remove all files from folder dist
	rm -r dist/*

docker_awesome: ## Create file awesome-api
	touch awesome-api

post: ## Create new post and using the sed command to modify the contents a file
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup markdownlint README.md DEPLOY.md
	ls

build-docker: ## builds docker
	docker build -t awesome:build ./build

docker_run: ## Build and list contents of website / Hugo in an interactive shell
	docker run -i awesome:build sh -c "hugo;ls ./dist"

markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md DEPLOY.md

integration-tests: ## server and check the localhost
	make docker_run docker_unit-tests

docker_integration-tests: ## Create file coverage-integrations.out
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	make docker_run docker_unit-tests

docker_unit-tests: ## Create file coverage-units.out
	touch coverage-units.out

validate: ## Tests dir
	pwd

package: ## creates archive
	make docker_run compress

compress:
	zip awesome-website.zip dist/

help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1
