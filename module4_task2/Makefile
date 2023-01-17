## Declare variables for used commands
HUGO=hugo
SHELLCHECK=shellcheck
export PATH

## Declare a list of phony targets
.PHONY: build build-docker build-tools test


build:## Installhugo package, Run the hugo, Create a file
	$(HUGO)
	touch awesome-api

build-docker:## Build a Docker image for the build directory
	docker build -t "awesome:build" ./build --no-cache

build-tools:## Install the hugo package and tools
	sudo apt install ./hugo.deb

test:## Run the clean target inside a Docker container , execute hugo and ls ./dist
	docker run awesome:build sh -c "make clean || echo 'Lint Failed'"
	docker run awesome:build sh -c "hugo; ls ./dist/*"

clean:## Remove all files in the dist directory
	rm -rf ./dist*

post:## Create a new post and set the title
	$(HUGO) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## Check and clean your Dockerfile with Hadolint
	hadolint ./build/Dockerfile

markdownlint: ## Run the markdownlint tool on the README.md and DEPLOY.md files
	markdownlint README.md DEPLOY.md

shellcheck:## Run the shellcheck tool on the setup.sh script
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

integration-tests:## Create a coverage-integrations.out file
	touch coverage-integrations.out

unit-tests:## Create a coverage-units.out file
	touch coverage-units.out

validate:## List the contents of the dist directory
	pwd

package:## Build the site, Create a dist directory, Create zip archive the dist
	make build
	zip awesome-website.zip dist

docker-tests:  ## Docker Image Testing With Container Structure Tests
	container-structure-test test --image awesome:build --config ./build/cst.yml

help: ##Print all lines in the Makefile that contain "##"
	
	cat Makefile | grep '##' | tr -d '##' | head -n -1
