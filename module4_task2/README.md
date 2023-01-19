# Module 1: Introduction to DevOps: Automate Everything

## Learning Objectives

This project aims at showing use cases where a DevOps mindset is bringing value
to software project by automating it, which decreases the amount of manual work
and increases the development speed. It focuses on why automation is useful and
 helps speeding a development lifecycle.

After this project, you should be able to:

- Understand the value of automating tedious tasks
- Define a development lifecycle
- Automate shell-like tasks with Make, and/or shell script
- Be aware of tools dependencies and the value of reproducing environment
- Build static HTML website from Markdown code using Go-Hugo

## Prerequisites

The following elements are required In addition to the previous module (“Module
0:Linux Fundamentals, Code management with Git, GitHub and the GitFlow pattern”)
prerequisites.

Concepts

You should have a basic knowledge of the following concepts:

- Shell terminal basics, using command lines:

- Navigating in a Unix file-system
- Understanding how stdin/stdout redirection and piping
- Showing and searching the content of a text files
- Defining and using Environment Variables
- Adding command lines to your terminal using the apt-get package manager and/or
with the PATH variable
- Writing and executing a shell script

- Git with the command line (and also a graphical interface)

- Retrieving or creating a repository
- Manipulating changes locally with Git’s 3 steps process (workspace, staging,
history)
- Distributing changes history with remotes repositories

- Make/Makefile usage:

- Executing tasks through make targets
- Default target and PHONY target
- Makefile’s variables and macro syntax

Tooling

This project needs the following tools / services:

- An HTML5-compliant web browser (Firefox, Chrome, Opera, Safari, Edge, etc.)
- A free account on [GitHub](https://github.com/), referenced as `GitHub Handle`
- A shell terminal with bash, zsh or ksh, including the standard Unix toolset
(ls, cd, etc.)
- [GNU](https://www.gnu.org/software/make/) Make in version 3.81+
- [Git](https://git-scm.com/book/en/v2/Getting-Started-The-Command-Line)
(command line) in version 2+
- [Go Hugo](https://gohugo.io/) v0.80+

How to use the make file:

## Build Workflow

You can see that some tools required to build our application, like make or
Golang, are available. But others are missing.

There are 2 different strategies to solve this challenge, each one with its pro
and cons:

- Install the tools during the build:

- ✅ It ensures that you have an automated and always up-to-date installation
system
- ❌ but it slows down the builds (you have to wait for all tools be installed
while you want a feedback as soon as possible)
- Ensure that the workflow is running inside a pre-built environment with all
the required tools

- ✅ Fast feedback: you don’t need to wait for tools installation
- ❌ Maintenance overhead as you need to manage the pre-built environment
For this module, we’ll use the 1st strategy, and the 2nd will be covered in the
“Docker” module.

It should be an easy step: you already wrote a script `setup.sh` which role was
to install Hugo in the production environment: let’s reuse this work!

You are expected to create new workflow named `module3_task1` from the previous
workflow.

This new workflow should execute the following targets as distinct steps:
`lint`, `build`, `unit-tests`, `validate` and `integration-tests`.

Regarding the tooling, you have to:

- Ensure that the workflow is executed into an `Ubuntu 18.04` execution
environment
- Ensure that all the required tools are installed prior to any `make` target,
by executing the script `setup.sh`
- ⚠️ The script should be modified to only install missing tools (no `make`
target are expected)
- ✨ As you are expected to understand the value of linters, tests and
documentation, you are also expected to lint the script setup.sh during
the target `make lint` using `Shellcheck`

## Workflow

You are expected to create a new [workflow](https://docs.github.com/en/actions)
named `module3_task0` with only the following steps:

- Clone the repository,
- Position yourself in the correct directory and execute the command `make help`
to validate that the Makefile is present and implements the help target.

This workflow must be [triggered](https://docs.github.com/en/actions/using-workflows/events-that-trigger-workflows):

- Each time there is new code pushed on your repository,
- And once per day (whatever time you want).

## Lifecycle

To execute the make file use the following syntax `make <command>`

`build`:
 Builds a new version of the website to folder `/dist/`
`clean`:
Removes the contents the folder `/dist/`
`post`:
Creates a new post in the contents/post folder with POST_TITLE and POST_NAME
set from the ENV variables
`help`:
Prints out information of the commands to the terminal.

## Story

Congratulations!

It’s your first day at “Awesome Inc.” as a software engineer. This company is
currently experiencing fast growth and hired you to work on their web services

Your predecessor left to travel the world, and the expectations are high on your
ability to help "Awesome Inc.” to grow a culture of collaboration with a
technical mindset, while managing their existing web services. That’s exactly
what DevOps is about!

# Workflow

- install tools
- lint
- help
- build
- build-docker
- docker-tests

# Build Workflow

- package
- relase
- archive build
- upload-package
- deploy
