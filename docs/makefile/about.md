# Guide to Understanding and Using Makefile with Symfony

*Note: This guide is tailored for software developers familiar with Symfony and aims to explain how to use the provided Makefile to streamline development tasks.*

## Introduction

Makefiles are traditionally used in C/C++ projects to control the build process, but they can be incredibly useful in automating repetitive tasks in any project, including those built with Symfony. By leveraging a Makefile, you can simplify complex command sequences, enforce consistency, and improve productivity.

This guide will walk you through understanding and using the provided Makefile in your Symfony project.

## Overview of the Makefile

The provided Makefile is designed to automate various tasks associated with Symfony development, such as:

- Managing Composer dependencies
- Clearing cache
- Running tests and static analysis
- Managing Docker containers
- Working with Elasticsearch
- Deploying the application

The Makefile is divided into several sections, each handling different aspects of the development workflow.

## Sections Breakdown

Let's explore each section of the Makefile in detail.

### Setup and Parameters

```makefile
# Parameters
SHELL         = sh
PROJECT       = aiup
GIT_AUTHOR    = COil
HTTP_PORT     = 8000

# Executables
EXEC_PHP      = php
COMPOSER      = composer
REDIS         = redis-cli
GIT           = git
YARN          = yarn
NPX           = npx
```

#### Explanation

- **SHELL**: Specifies the shell to use for executing commands.
- **PROJECT**: The project name, used in custom Symfony commands.
- **GIT_AUTHOR**: The Git author name, used in the `stats` target.
- **HTTP_PORT**: The port on which the Symfony server will run.

#### Executables

These variables define the paths or commands for executables used throughout the Makefile. This allows for easy modification if the paths change.

### Aliases and Executables

```makefile
# Alias
SYMFONY       = $(EXEC_PHP) bin/console

# Executables: vendors
PHPUNIT       = ./vendor/bin/phpunit
PHPSTAN       = ./vendor/bin/phpstan
PHP_CS_FIXER  = ./vendor/bin/php-cs-fixer
PHPMETRICS    = ./vendor/bin/phpmetrics

# Executables: local only
SYMFONY_BIN   = symfony
BREW          = brew
DOCKER        = docker
DOCKER_COMP   = docker compose
```

#### Explanation

- **SYMFONY**: An alias for the Symfony console command, simplifying its usage in targets.
- **Vendor Executables**: Paths to executables installed via Composer, like PHPUnit and PHPStan.
- **Local Executables**: Commands available only on the local development machine.

### Default Goal and Phony Targets

```makefile
.DEFAULT_GOAL = help
.PHONY        : help install ...
```

#### Explanation

- **.DEFAULT_GOAL**: Specifies the default target when running `make` without arguments. Here, it's set to `help`.
- **.PHONY**: Declares phony targets that are not associated with files.

### Help Target

```makefile
help: ## Outputs this help screen
	@grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | \
    awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | \
    sed -e 's/\[32m##/[33m/'
```

#### Explanation

The `help` target parses the Makefile to generate a help screen displaying all available targets and their descriptions.

#### Usage

```bash
$ make help
```

### Composer Commands

```makefile
## —— Composer 🧙‍♂️ ————————————————————————————————————————————————————————————
install: composer.lock ## Install vendors according to the current composer.lock file
	@$(COMPOSER) install --no-progress --prefer-dist --optimize-autoloader
```

#### Explanation

- **install**: Installs PHP dependencies based on `composer.lock`.

#### Usage

```bash
$ make install
```

### PHP Management (macOS with Homebrew)

```makefile
## —— PHP 🐘 (macOS with brew) —————————————————————————————————————————————————
php-upgrade: ## Upgrade PHP to the last version
	@$(BREW) upgrade php

php-set-8-2: ## Set php 8.2 as the current PHP version
	@$(BREW) unlink php
	@$(BREW) link --overwrite php@8.2
```

#### Explanation

These targets help manage PHP versions using Homebrew on macOS.

#### Usage

```bash
$ make php-upgrade
$ make php-set-8-2
```

### Symfony Commands

```makefile
## —— Symfony 🎵 ———————————————————————————————————————————————————————————————
sf: ## List all Symfony commands
	@$(SYMFONY)

cc: ## Clear the cache. DID YOU CLEAR YOUR CACHE????
	@$(SYMFONY) c:c

warmup: ## Warmup the cache
	@$(SYMFONY) cache:warmup
```

#### Explanation

- **sf**: Lists all Symfony console commands.
- **cc**: Clears the cache.
- **warmup**: Warms up the cache.

#### Usage

```bash
$ make cc
```

### Fixing Permissions and Assets

```makefile
fix-perms: ## Fix permissions of all var files
	@chmod -R 777 var/*

assets: purge ## Install the assets with symlinks in the public folder
	@$(SYMFONY) assets:install public/

purge: ## Purge cache and logs
	@rm -rf var/cache/* var/logs/*
```

#### Explanation

- **fix-perms**: Fixes permissions on the `var` directory.
- **assets**: Installs assets into the `public` directory.
- **purge**: Deletes cache and logs.

#### Usage

```bash
$ make assets
```

### Symfony Binary Commands

```makefile
## —— Symfony binary 💻 ————————————————————————————————————————————————————————
cert-install: ## Install the local HTTPS certificates
	@$(SYMFONY_BIN) server:ca:install

serve: ## Serve the application with HTTPS support
	@$(SYMFONY_BIN) serve --daemon --port=$(HTTP_PORT)

unserve: ## Stop the webserver
	@$(SYMFONY_BIN) server:stop
```

#### Explanation

- **cert-install**: Installs local HTTPS certificates.
- **serve**: Starts the Symfony local web server.
- **unserve**: Stops the Symfony local web server.

#### Usage

```bash
$ make serve
```

### Elasticsearch Commands

```makefile
## —— elasticsearch 🔎 —————————————————————————————————————————————————————————
populate: ## Reset and populate the Elasticsearch index
	@$(SYMFONY) strangebuzz:index-articles

list-index: ## List all indexes on the cluster
	@curl http://localhost:9209/_cat/indices?v

delete-index: ## Delete a given index
	@curl -X DELETE "localhost:9209/$(index)?pretty"
```

#### Explanation

- **populate**: Populates the Elasticsearch index with data.
- **list-index**: Lists all indexes in the Elasticsearch cluster.
- **delete-index**: Deletes a specified Elasticsearch index.

#### Usage

```bash
$ make populate
$ make delete-index index=app_2021-01-05-075600
```

### Docker Commands

```makefile
## —— Docker 🐳 ————————————————————————————————————————————————————————————————
up: ## Start the docker hub
	$(DOCKER_COMP) up --detach

build: ## Builds the images
	$(DOCKER_COMP) build --pull --no-cache

down: ## Stop the docker hub
	$(DOCKER_COMP) down --remove-orphans
```

#### Explanation

- **up**: Starts Docker containers defined in `docker-compose.yml`.
- **build**: Builds Docker images.
- **down**: Stops and removes Docker containers and networks.

#### Usage

```bash
$ make up
$ make down
```

### Project Management Commands

```makefile
## —— Project 🐝 ———————————————————————————————————————————————————————————————
start: up wait-for-mysql load-fixtures populate serve ## Start docker and services

reload: load-fixtures populate ## Load fixtures and repopulate Elasticsearch

stop: down unserve ## Stop docker and the Symfony server
```

#### Explanation

- **start**: Starts the entire development environment.
- **reload**: Reloads database fixtures and repopulates Elasticsearch index.
- **stop**: Stops Docker containers and the Symfony server.

#### Usage

```bash
$ make start
$ make stop
```

### Clearing Redis Cache

```makefile
cc-redis: ## Flush all Redis cache
	@$(REDIS) -p 6389 flushall
```

#### Usage

```bash
$ make cc-redis
```

### Loading Fixtures

```makefile
load-fixtures: ## Build the DB, load fixtures
	@$(SYMFONY) doctrine:cache:clear-metadata
	@$(SYMFONY) doctrine:database:create --if-not-exists
	@$(SYMFONY) doctrine:schema:drop --force
	@$(SYMFONY) doctrine:schema:create
	@$(SYMFONY) doctrine:schema:validate
	@$(SYMFONY) hautelook:fixtures:load --no-interaction
```

#### Explanation

This target rebuilds the database schema and loads data fixtures.

#### Usage

```bash
$ make load-fixtures
```

### Testing Commands

```makefile
## —— Tests ✅ —————————————————————————————————————————————————————————————————
test: phpunit.xml check ## Run tests with optional suite and filter
	@$(eval testsuite ?= 'all')
	@$(eval filter ?= '.')
	@$(PHPUNIT) --testsuite=$(testsuite) --filter=$(filter) --stop-on-failure

test-all: phpunit.xml ## Run all tests
	@$(PHPUNIT) --stop-on-failure
```

#### Explanation

- **test**: Runs PHPUnit tests with optional `testsuite` and `filter` parameters.
- **test-all**: Runs all PHPUnit tests.

#### Usage

```bash
$ make test
$ make test testsuite=unit filter=UserTest
```

### Coding Standards and Static Analysis

```makefile
## —— Coding standards ✨ ——————————————————————————————————————————————————————
cs: fix-php fix-js stan ## Run all coding standards checks

static-analysis: stan ## Run the static analysis (PHPStan)

stan: ## Run PHPStan
	@$(PHPSTAN) analyse -c configuration/phpstan.neon --memory-limit 1G

lint-php: ## Lint files with php-cs-fixer
	@$(PHP_CS_FIXER) fix --allow-risky=yes --dry-run --config=php-cs-fixer.php

fix-php: ## Fix files with php-cs-fixer
	@PHP_CS_FIXER_IGNORE_ENV=1 $(PHP_CS_FIXER) fix --allow-risky=yes --config=php-cs-fixer.php
```

#### Explanation

- **cs**: Runs code style fixes and static analysis.
- **stan**: Runs PHPStan for static analysis.
- **lint-php**: Checks PHP files for coding standards without modifying them.
- **fix-php**: Fixes PHP files to meet coding standards.

#### Usage

```bash
$ make cs
$ make stan
```

### Deployment Commands

```makefile
## —— Deploy & Prod 🚀 —————————————————————————————————————————————————————————
deploy: ## Full no-downtime deployment with EasyDeploy
	@test -z "`git status --porcelain`"
	@test -z "`git diff --stat --cached origin/master`"
	@$(SYMFONY) deploy -v
```

#### Explanation

- **deploy**: Deploys the application using EasyDeploy, ensuring no local changes are uncommitted or unpushed.

#### Usage

```bash
$ make deploy
```

### Yarn and JavaScript Commands

```makefile
## —— Yarn 🐱 / JavaScript —————————————————————————————————————————————————————
dev: ## Rebuild assets for the dev env
	@$(YARN) install --check-files
	@$(YARN) run encore dev

watch: ## Watch files and build assets when needed for the dev env
	@$(YARN) run encore dev --watch

encore: ## Build assets for production
	@$(YARN) run encore production

lint-js: ## Lints JS coding standards
	@$(NPX) eslint assets/js

fix-js: ## Fixes JS files
	@$(NPX) eslint assets/js --fix
```

#### Explanation

- **dev**: Installs dependencies and builds assets for development.
- **watch**: Watches for file changes and rebuilds assets.
- **encore**: Builds assets for production.
- **lint-js**: Checks JavaScript files for coding standards.
- **fix-js**: Fixes JavaScript files to meet coding standards.

#### Usage

```bash
$ make dev
$ make watch
$ make fix-js
```

### Stats and Metrics

```makefile
## —— Stats 📜 —————————————————————————————————————————————————————————————————
stats: ## Commits by the hour for the main author of this project
	@$(GIT) log --author="$(GIT_AUTHOR)" --date=iso | perl -nalE '...' 
```

#### Explanation

- **stats**: Generates a histogram of commits by hour for the specified Git author.

#### Usage

```bash
$ make stats
```

### JWT Commands

```makefile
## —— JWT 🕸 ———————————————————————————————————————————————————————————————————
BEARER    = `cat ./config/jwt/bearer.txt`
BASE_URL  = https://127.0.0.1#https://www.strangebuzz.com
PORT      = :8000

jwt-generate-keys: ## Generate the main JWT key set
	@mkdir -p config/jwt
	@openssl genpkey -out ./config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096
	@openssl pkey -in ./config/jwt/private.pem -out ./config/jwt/public.pem -pubout

jwt-create-ok: ## Create a JWT for a valid test account
	@curl -s POST -H "Content-Type: application/json" ${BASE_URL}${PORT}/api/login_check -d '{"username":"reader","password":"test"}' | jq .token | sed "s/\"//g"
```

#### Explanation

- **jwt-generate-keys**: Generates JWT private and public keys.
- **jwt-create-ok**: Obtains a JWT token for a valid user.

#### Usage

```bash
$ make jwt-generate-keys
$ make jwt-create-ok
```

### Code Quality Reports

```makefile
## —— Code Quality reports 📊 ——————————————————————————————————————————————————
report-metrics: ## Run the phpmetrics report
	@$(PHPMETRICS) --report-html=var/phpmetrics/ src/

coverage: ## Create the code coverage report with PHPUnit
	$(EXEC_PHP) -d xdebug.enable=1 -d xdebug.mode=coverage -d memory_limit=-1 vendor/bin/phpunit --coverage-html=var/coverage
```

#### Explanation

- **report-metrics**: Generates PHP Metrics reports.
- **coverage**: Generates code coverage reports using PHPUnit and Xdebug.

#### Usage

```bash
$ make report-metrics
$ make coverage
```

## Best Practices

- **Use `make help`**: Always start by checking available commands.
- **Customize Variables**: Adjust variables like `HTTP_PORT`, `GIT_AUTHOR`, and paths as per your project setup.
- **Consistency**: Use the Makefile for all routine tasks to ensure consistency across your team.
- **Extend the Makefile**: Add new targets for repetitive tasks specific to your project.

