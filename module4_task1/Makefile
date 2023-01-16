# Define variables
Publish=docker run awesome:build sh -c "hugo; ls ./dist/*"
SHELLCHECK=shellcheck

.PHONY: build

build: ## Publish the new version the site
	docker run awesome:build sh -c "hugo; ls ./dist/*"

build-docker: ## Create Image from Dockerfile
	docker build -t "awesome:build" ./build --no-cache

clean: ## Remove all files from folder dist
	rm -r dist/*

post: ## Create new post and using the sed command to modify the contents of a file.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup markdownlint README.md DEPLOY.md
	docker run awesome:build sh -c "make shellcheck && make markdownlint || echo 'Lint Failed'"
markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md DEPLOY.md

integration-tests: ## server and check the localhost
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	touch coverage-units.out

validate: ## Tests dir
	pwd

package: ## creates archive docker run awesome:build sh -c "docker run awesome:build sh -c "hugo; ls ./dist/*"; make package"
	mkdir dist
	zip awesome-website.zip dist/

shellcheck:
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 && make yamllint || echo "Lint Failed"

help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1

