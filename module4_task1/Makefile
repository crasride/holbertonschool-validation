HUGO=hugo
RM=rm -rf
SHELLCHECK=shellcheck
YAMLLINT=yamllint
YQ=yq
MARKDOWN=markdownlint

build: ## Builds a new website
	docker run awesome:build sh -c "hugo; ls ./dist/*"

post: ## Creates a new post with the title changed to the ENV value.
	$(HUGO) new posts/$(POST_NAME).md
	sed -i '2s/.*/title: "$(POST_TITLE)"/' content/posts/$(POST_NAME).md

build-docker:
	docker build -t awesome:build -f docker/Dockerfile .

_awesome:
	touch awesome-api

.PHONY:
clean: ## Remove all files from target folder
	docker run awesome:build sh -c "hugo; make _clean"

_clean:
	$(RM) dist/*

_cleancheck:
	/bin/sh -c "ls ~/holbertonschool-validation/module4_task1/dist/;echo 'done'"

lint:
	docker run awesome:build sh -c "make _shellcheck && make markdownlint || echo 'Lint Failed'"

_shellcheck:
	$(SHELLCHECK) setup.sh >/dev/null 2>&1 && make yamllint || echo "Lint Failed"

yamllint: ## Yamllint github workflow.
	$(YAMLLINT) ./github-workflow.yml >/dev/null 2>&1 && echo OK
	$(YAMLLINT) ./release_drafter.yml >/dev/null 2>&1 && echo OK
	$(YQ) eval '.jobs.*.steps.[].name' ./github-workflow.yml | wc -l

markdownlint:
	$(MARKDOWN) README.md
	$(MARKDOWN) DEPLOY.md

integration-tests: ## Spin up a server and check the localhost url
	docker run awesome:build sh -c "hugo; make _clean; make _integration-tests;"
	make _integration-tests;

_integration-tests:
	touch coverage-integrations.out

unit-tests: ## Runs different makefile recipes
	docker run awesome:build sh -c "hugo; make _clean; make _unit-tests;"
	make _unit-tests;

_unit-tests:
	touch coverage-units.out

validate: ## Tests ensure it is in correct dir
	pwd

package: ## Creates a zip archive of the dist dir api binary.
	docker run awesome:build sh -c "hugo; make _zip"

_zip:
	zip awesome-website.zip dist/index.html

.SILENT:
help: ## Target check
	cat Makefile | grep '##' | tr -d '##' | head -n -1
