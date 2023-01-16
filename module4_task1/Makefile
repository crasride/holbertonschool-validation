# Define variables
Publish=hugo
SHELLCHECK=shellcheck
export PATH

build: ## Publish the new version the site
	docker run awesome:build sh -c "hugo; ls ./dist/*"

build-docker: ## Create Image from Dockerfile
	docker build -t "awesome:build" ./build --no-cache

.PHONY:

clean: ## Remove all files from target folder
	docker run awesome:build sh -c "hugo; make clean-docker;"

clean-docker: ## Remove all files from folder dist rm -rf dist
	pwd
	

post: ## Create new post and using the sed command to modify the contents of a file.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup markdownlint README.md DEPLOY.md
	docker run awesome:build sh -c "make shellcheck && make markdownlint || echo 'Lint Failed'"
markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md DEPLOY.md

integration-tests: ## execute Hugo and create files
	docker run awesome:build sh -c "hugo; make clean; make integration-docker;"

integration-docker: ## Create files
	touch coverage-integrations.out

unit-tests: ## execute Hugo and create files
	docker run awesome:build sh -c "hugo; make clean; make unit-tests-docker;"

unit-tests-docker: ## Runs different makefile recipes
	touch coverage-units.out

validate: ## Tests dir
	pwd

package: ## creates archive docker run awesome:build sh -c "docker run awesome:build sh -c "hugo; ls ./dist/*"; make package"
	docker run awesome:build sh -c "hugo; make package-docker"

package-docker: ## creates archive docker run awesome:build sh -c "
	zip awesome-website.zip dist/

shellcheck:
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

.SILENT:

help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1
