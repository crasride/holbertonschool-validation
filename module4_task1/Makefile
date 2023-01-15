# Define variables
Publish=hugo
SHELLCHECK=shellcheck

build: ## Publish the new version the site
	docker run awesome:build sh -c "hugo; ls ./dist/*"

clean: ## Remove all files from folder dist
	rm -r dist/*

post: ## Create new post and using the sed command to modify the contents of a file.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup markdownlint README.md DEPLOY.md
	hugo
markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md DEPLOY.md

integration-tests: ## server and check the localhost
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	touch coverage-units.out

validate: ## Tests dir
	pwd

package: ## creates archive docker run awesome:build sh -c "hugo; make package"
	make build
	zip awesome-website.zip dist/

.PHONY:

build-docker: ## Create Image from Dockerfile
	docker build -t "awesome:build" ./build --no-cache

.SILENT:

help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1

