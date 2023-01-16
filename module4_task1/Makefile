# Define variables
Publish=hugo
SHELLCHECK=shellcheck
export PATH

.PHONY: build
build: ## install Hugo , public and create file
	sudo apt install ./hugo.deb
	$(Publish)
	touch awesome-api

.PHONY: build-docker
build-docker: ## Create Image from Dockerfile
	docker build -t "awesome:build" ./build --no-cache

.PHONY: build-tools
build-tools: ## install hugo
	sudo apt install ./hugo.deb

clean: ## Remove folder Public
	rm -rf ./dist*

post: ## Create new post and using the sed command to modify the contents of a file.
	$(Publish) new posts/$(POST_NAME).md
	sed -i 's/title: .*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

lint: ## shellcheck setup markdownlint README.md DEPLOY.md
	apt install curl -y
	curl --silent --location https://deb.nodesource.com/setup_16.x | bash -
	apt install nodejs -y
	npm install -g markdownlint-cli 1>&2
	markdownlint README.md DEPLOY.md

markdownlint: ## updated to lint the files README.md and DEPLOY.md
	markdownlint README.md DEPLOY.md

shellcheck: ## validate shellcheck
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 || echo "Lint Failed"

integration-tests: ## create files
	touch coverage-integrations.out

unit-tests: ## create files
	touch coverage-units.out

validate: ## Tests dir
	ls dist

package: ## execute build y create file zip
	make build
	mkdir -p dist
	zip awesome-website.zip dist

.SILENT:

help: ## Display the list of targets and their usage.
	cat Makefile | grep '##' | tr -d '##' | head -n -1
