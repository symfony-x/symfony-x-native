# Guide to Understanding and Using Makefile with Symfony

*Note: This guide is tailored for software developers familiar with Symfony. It provides a comprehensive primer on each section of the provided Makefile, explaining the tools and commands used, and offering examples of their command-line usage.*

## Introduction

Makefiles are powerful tools traditionally used for compiling code, but they can also automate repetitive tasks in any project. In Symfony development, a Makefile can streamline workflows by encapsulating complex commands and sequences into simple targets.

This guide breaks down each section of the provided Makefile, explaining the programs being executed, what they do, and offering practical examples.

---

## Table of Contents

1. [Setup and Parameters](#setup-and-parameters)
2. [Aliases and Executables](#aliases-and-executables)
3. [Default Goal and Phony Targets](#default-goal-and-phony-targets)
4. [Help Target](#help-target)
5. [Composer Commands](#composer-commands)
6. [PHP Management (macOS with Homebrew)](#php-management-macos-with-homebrew)
7. [Symfony Commands](#symfony-commands)
8. [Fixing Permissions and Assets](#fixing-permissions-and-assets)
9. [Symfony Binary Commands](#symfony-binary-commands)
10. [Elasticsearch Commands](#elasticsearch-commands)
11. [Docker Commands](#docker-commands)
12. [Project Management Commands](#project-management-commands)
13. [Clearing Redis Cache](#clearing-redis-cache)
14. [Loading Fixtures](#loading-fixtures)
15. [Testing Commands](#testing-commands)
16. [Coding Standards and Static Analysis](#coding-standards-and-static-analysis)
17. [Deployment Commands](#deployment-commands)
18. [Yarn and JavaScript Commands](#yarn-and-javascript-commands)
19. [Stats and Metrics](#stats-and-metrics)
20. [JWT Commands](#jwt-commands)
21. [Code Quality Reports](#code-quality-reports)
22. [Best Practices](#best-practices)
23. [Conclusion](#conclusion)

---

## Setup and Parameters

### Primer

This section sets up variables that will be used throughout the Makefile. These variables define the environment, project settings, and paths to executables.

#### Parameters

```makefile
# Parameters
SHELL         = sh
PROJECT       = aiup
GIT_AUTHOR    = COil
HTTP_PORT     = 8000
```

- **SHELL**: Specifies the shell to use for executing commands (default is `sh`).
- **PROJECT**: The project name, used in custom Symfony commands.
- **GIT_AUTHOR**: The Git author name, used in generating commit statistics.
- **HTTP_PORT**: The port on which the application will run.

#### Executables

```makefile
# Executables
EXEC_PHP      = php
COMPOSER      = composer
REDIS         = redis-cli
GIT           = git
YARN          = yarn
NPX           = npx
```

These variables point to the command-line tools used in the Makefile:

- **EXEC_PHP**: The PHP executable.
- **COMPOSER**: Composer, the dependency manager for PHP.
- **REDIS**: Redis CLI, used for interacting with the Redis server.
- **GIT**: Git version control system.
- **YARN**: Yarn package manager for JavaScript.
- **NPX**: Node Package Runner, used to execute Node.js packages without installing them globally.

### Examples

- **Checking PHP Version**:

  ```bash
  $ php -v
  ```

- **Composer Version**:

  ```bash
  $ composer --version
  ```

- **Git Status**:

  ```bash
  $ git status
  ```

---

## Aliases and Executables

### Primer

This section defines aliases for commands and specifies paths to vendor executables and local tools.

#### Aliases

```makefile
# Alias
SYMFONY       = $(EXEC_PHP) bin/console
```

- **SYMFONY**: An alias to execute Symfony console commands using PHP.

#### Vendor Executables

```makefile
# Executables: vendors
PHPUNIT       = ./vendor/bin/phpunit
PHPSTAN       = ./vendor/bin/phpstan
PHP_CS_FIXER  = ./vendor/bin/php-cs-fixer
PHPMETRICS    = ./vendor/bin/phpmetrics
```

These are tools installed via Composer:

- **PHPUNIT**: Testing framework for PHP.
- **PHPSTAN**: Static analysis tool for PHP.
- **PHP_CS_FIXER**: Tool to fix coding standards in PHP code.
- **PHPMETRICS**: Generates code metrics reports.

#### Local Executables

```makefile
# Executables: local only
SYMFONY_BIN   = symfony
BREW          = brew
DOCKER        = docker
DOCKER_COMP   = docker compose
```

- **SYMFONY_BIN**: The Symfony CLI tool.
- **BREW**: Homebrew package manager (macOS).
- **DOCKER**: Docker engine command-line tool.
- **DOCKER_COMP**: Docker Compose command.

### Examples

- **Running a Symfony Command**:

  ```bash
  $ php bin/console cache:clear
  ```

- **Using PHPStan**:

  ```bash
  $ ./vendor/bin/phpstan analyse src/
  ```

---

## Default Goal and Phony Targets

### Primer

This section defines the default target and declares phony targets to avoid conflicts with files of the same name.

#### Default Goal

```makefile
.DEFAULT_GOAL = help
```

- Sets `help` as the default target when running `make` without arguments.

#### Phony Targets

```makefile
.PHONY: help install ...
```

- Declares targets as phony, meaning they are not associated with files.

### Examples

- **Running Default Target**:

  ```bash
  $ make
  ```

- **Defining a Phony Target**:

  ```makefile
  .PHONY: clean
  clean:
    rm -rf var/cache/*
  ```

---

## Help Target

### Primer

Generates a help screen listing all available Makefile targets with descriptions.

#### Implementation

```makefile
help: ## Outputs this help screen
    @grep -E '(^[a-zA-Z0-9_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | \
    awk 'BEGIN {FS = ":.*?## "}{printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | \
    sed -e 's/\[32m##/[33m/'
```

- **grep**: Searches for lines with targets and descriptions.
- **awk**: Formats the output.
- **sed**: Adjusts the color coding.

### Usage

```bash
$ make help
```

Displays all Makefile targets with their descriptions.

---

## Composer Commands

### Primer

Composer is the dependency manager for PHP. It allows you to install and manage libraries your project depends on.

#### Commands

- **composer install**: Installs dependencies from `composer.lock`.
- **composer update**: Updates dependencies to the latest versions allowed by `composer.json`.

#### Makefile Target

```makefile
install: composer.lock ## Install vendors according to the current composer.lock file
    @$(COMPOSER) install --no-progress --prefer-dist --optimize-autoloader
```

- **--no-progress**: Disables the progress bar.
- **--prefer-dist**: Prefers installing from distribution archives.
- **--optimize-autoloader**: Optimizes the autoloader during installation.

### Examples

- **Installing Dependencies**:

  ```bash
  $ make install
  ```

- **Composer Install Command**:

  ```bash
  $ composer install --no-progress --prefer-dist --optimize-autoloader
  ```

---

## PHP Management (macOS with Homebrew)

### Primer

**Homebrew** is a package manager for macOS that simplifies the installation of software. It allows you to install and manage multiple versions of PHP on your system.

#### Makefile Targets

```makefile
php-upgrade: ## Upgrade PHP to the last version
    @$(BREW) upgrade php

php-set-8-2: ## Set php 8.2 as the current PHP version
    @$(BREW) unlink php
    @$(BREW) link --overwrite php@8.2
```

- **php-upgrade**: Upgrades PHP to the latest version available via Homebrew.
- **php-set-8-2**: Switches the active PHP version to 8.2.

#### How PHP Works with Homebrew and macOS

Homebrew installs PHP versions in `/usr/local/Cellar/`, and symlinks them to `/usr/local/bin/`. By unlinking and linking different versions, you can switch between them.

### Examples

- **Upgrade PHP**:

  ```bash
  $ make php-upgrade
  ```

- **Switch to PHP 8.2**:

  ```bash
  $ make php-set-8-2
  ```

- **Homebrew Commands**:

  ```bash
  $ brew upgrade php
  $ brew unlink php
  $ brew link --overwrite php@8.2
  ```

---

## Symfony Commands

### Primer

Symfony provides a console component that allows you to execute various commands related to your application.

#### Makefile Targets

```makefile
sf: ## List all Symfony commands
    @$(SYMFONY)

cc: ## Clear the cache. DID YOU CLEAR YOUR CACHE????
    @$(SYMFONY) c:c

warmup: ## Warmup the cache
    @$(SYMFONY) cache:warmup
```

- **sf**: Lists all Symfony console commands.
- **cc**: Clears the application cache.
- **warmup**: Warms up the cache.

### Examples

- **Clear Cache**:

  ```bash
  $ make cc
  ```

- **List Commands**:

  ```bash
  $ make sf
  ```

- **Symfony Console Command**:

  ```bash
  $ php bin/console cache:clear
  ```

---

## Fixing Permissions and Assets

### Primer

Proper permissions ensure your application can read and write necessary files. Installing assets moves web assets from bundles to the public directory.

#### Makefile Targets

```makefile
fix-perms: ## Fix permissions of all var files
    @chmod -R 777 var/*

assets: purge ## Install the assets with symlinks in the public folder
    @$(SYMFONY) assets:install public/

purge: ## Purge cache and logs
    @rm -rf var/cache/* var/logs/*
```

- **fix-perms**: Sets permissions to read, write, and execute for all users on files in `var/`.
- **assets**: Installs web assets into `public/`.
- **purge**: Deletes cache and log files.

### Examples

- **Fix Permissions**:

  ```bash
  $ make fix-perms
  ```

- **Install Assets**:

  ```bash
  $ make assets
  ```

- **Purge Cache and Logs**:

  ```bash
  $ make purge
  ```

---

## Symfony Binary Commands

### Primer

The Symfony CLI tool assists with local development tasks, including setting up HTTPS and running a local web server.

#### Makefile Targets

```makefile
cert-install: ## Install the local HTTPS certificates
    @$(SYMFONY_BIN) server:ca:install

serve: ## Serve the application with HTTPS support
    @$(SYMFONY_BIN) serve --daemon --port=$(HTTP_PORT)

unserve: ## Stop the webserver
    @$(SYMFONY_BIN) server:stop
```

- **cert-install**: Installs a local certificate authority for HTTPS.
- **serve**: Starts the local web server.
- **unserve**: Stops the local web server.

### Examples

- **Install HTTPS Certificates**:

  ```bash
  $ make cert-install
  ```

- **Start Server**:

  ```bash
  $ make serve
  ```

- **Stop Server**:

  ```bash
  $ make unserve
  ```

---

## Elasticsearch Commands

### Primer

Elasticsearch is a search engine used for full-text search and analytics.

#### Makefile Targets

```makefile
populate: ## Reset and populate the Elasticsearch index
    @$(SYMFONY) strangebuzz:index-articles

list-index: ## List all indexes on the cluster
    @curl http://localhost:9209/_cat/indices?v

delete-index: ## Delete a given index
    @curl -X DELETE "localhost:9209/$(index)?pretty"
```

- **populate**: Populates the Elasticsearch index.
- **list-index**: Lists all indexes in Elasticsearch.
- **delete-index**: Deletes a specified index.

### Examples

- **Populate Index**:

  ```bash
  $ make populate
  ```

- **List Indexes**:

  ```bash
  $ make list-index
  ```

- **Delete Index**:

  ```bash
  $ make delete-index index=my_index
  ```

---

## Docker Commands

### Primer

Docker allows you to containerize applications, ensuring consistent environments across development, testing, and production.

#### Makefile Targets

```makefile
up: ## Start the docker hub
    $(DOCKER_COMP) up --detach

build: ## Builds the images
    $(DOCKER_COMP) build --pull --no-cache

down: ## Stop the docker hub
    $(DOCKER_COMP) down --remove-orphans

sh: ## Log to the docker container
    @$(DOCKER_COMP) exec php sh

logs: ## Show live logs
    @$(DOCKER_COMP) logs --tail=0 --follow
```

- **up**: Starts Docker containers in the background.
- **build**: Builds Docker images without using cache.
- **down**: Stops and removes containers and networks.
- **sh**: Opens a shell in the `php` container.
- **logs**: Displays live logs from containers.

### Examples

- **Start Containers**:

  ```bash
  $ make up
  ```

- **Build Images**:

  ```bash
  $ make build
  ```

- **Stop Containers**:

  ```bash
  $ make down
  ```

- **Access Container Shell**:

  ```bash
  $ make sh
  ```

- **View Logs**:

  ```bash
  $ make logs
  ```

---

## Project Management Commands

### Primer

Combines multiple tasks to streamline starting, stopping, and reloading your project.

#### Makefile Targets

```makefile
start: up wait-for-mysql load-fixtures populate serve ## Start docker, load fixtures, populate the Elasticsearch index and start the webserver

reload: load-fixtures populate ## Load fixtures and repopulate Elasticsearch index

stop: down unserve ## Stop docker and the Symfony binary server
```

- **start**: Initializes the project environment.
- **reload**: Reloads the database and Elasticsearch index.
- **stop**: Shuts down the environment.

### Examples

- **Start Project**:

  ```bash
  $ make start
  ```

- **Reload Project**:

  ```bash
  $ make reload
  ```

- **Stop Project**:

  ```bash
  $ make stop
  ```

---

## Clearing Redis Cache

### Primer

Clears all data from the Redis cache, which can be necessary when you need to reset cached information.

#### Makefile Target

```makefile
cc-redis: ## Flush all Redis cache
    @$(REDIS) -p 6389 flushall
```

- **cc-redis**: Flushes all data from Redis on port 6389.

### Examples

- **Clear Redis Cache**:

  ```bash
  $ make cc-redis
  ```

- **Redis CLI Command**:

  ```bash
  $ redis-cli -p 6389 flushall
  ```

---

## Loading Fixtures

### Primer

Fixtures are used to load a set of data into the database, useful for testing or resetting the development environment.

#### Makefile Target

```makefile
load-fixtures: ## Build the DB, load fixtures
    @$(SYMFONY) doctrine:cache:clear-metadata
    @$(SYMFONY) doctrine:database:create --if-not-exists
    @$(SYMFONY) doctrine:schema:drop --force
    @$(SYMFONY) doctrine:schema:create
    @$(SYMFONY) doctrine:schema:validate
    @$(SYMFONY) hautelook:fixtures:load --no-interaction
```

- Clears metadata cache, recreates the database schema, validates it, and loads fixtures.

### Examples

- **Load Fixtures**:

  ```bash
  $ make load-fixtures
  ```

- **Doctrine Commands**:

  ```bash
  $ php bin/console doctrine:schema:create
  $ php bin/console hautelook:fixtures:load
  ```

---

## Testing Commands

### Primer

Running tests ensures your application works as expected.

#### Makefile Targets

```makefile
test: phpunit.xml check ## Run tests with optional suite and filter
    @$(eval testsuite ?= 'all')
    @$(eval filter ?= '.')
    @$(PHPUNIT) --testsuite=$(testsuite) --filter=$(filter) --stop-on-failure

test-all: phpunit.xml ## Run all tests
    @$(PHPUNIT) --stop-on-failure
```

- **test**: Runs PHPUnit tests with optional `testsuite` and `filter`.
- **test-all**: Runs all PHPUnit tests.

### Examples

- **Run All Tests**:

  ```bash
  $ make test-all
  ```

- **Run Specific Tests**:

  ```bash
  $ make test testsuite=unit filter=UserTest
  ```

- **PHPUnit Command**:

  ```bash
  $ ./vendor/bin/phpunit --testsuite=unit --filter=UserTest
  ```

---

## Coding Standards and Static Analysis

### Primer

Maintaining code quality through consistent coding standards and static analysis tools.

#### Makefile Targets

```makefile
cs: fix-php fix-js stan ## Run all coding standards checks

static-analysis: stan ## Run the static analysis (PHPStan)

stan: ## Run PHPStan
    @$(PHPSTAN) analyse -c configuration/phpstan.neon --memory-limit 1G

lint-php: ## Lint files with php-cs-fixer
    @$(PHP_CS_FIXER) fix --allow-risky=yes --dry-run --config=php-cs-fixer.php

fix-php: ## Fix files with php-cs-fixer
    @PHP_CS_FIXER_IGNORE_ENV=1 $(PHP_CS_FIXER) fix --allow-risky=yes --config=php-cs-fixer.php
```

- **cs**: Runs code style fixes and static analysis.
- **stan**: Runs PHPStan analysis.
- **lint-php**: Checks for coding standard violations without making changes.
- **fix-php**: Fixes coding standard issues in code.

### Examples

- **Run Coding Standards Checks**:

  ```bash
  $ make cs
  ```

- **Run Static Analysis**:

  ```bash
  $ make stan
  ```

- **PHP CS Fixer Command**:

  ```bash
  $ ./vendor/bin/php-cs-fixer fix --allow-risky=yes --config=php-cs-fixer.php
  ```

---

## Deployment Commands

### Primer

Deploys the application to production using EasyDeploy.

#### Makefile Target

```makefile
deploy: ## Full no-downtime deployment with EasyDeploy
    @test -z "`git status --porcelain`"
    @test -z "`git diff --stat --cached origin/master`"
    @$(SYMFONY) deploy -v
```

- Checks for uncommitted changes and unpushed commits before deploying.

### Examples

- **Deploy Application**:

  ```bash
  $ make deploy
  ```

- **Symfony Deploy Command**:

  ```bash
  $ php bin/console deploy -v
  ```

---

## Yarn and JavaScript Commands

### Primer

Manages JavaScript dependencies and builds assets using Yarn and Webpack Encore.

#### Makefile Targets

```makefile
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

- **dev**: Installs dependencies and builds assets for development.
- **watch**: Watches for changes and rebuilds assets automatically.
- **encore**: Builds assets for production.
- **lint-js**: Checks JavaScript code for style issues.
- **fix-js**: Fixes JavaScript code style issues.

### Examples

- **Build Assets for Development**:

  ```bash
  $ make dev
  ```

- **Watch for Changes**:

  ```bash
  $ make watch
  ```

- **Lint JavaScript Code**:

  ```bash
  $ make lint-js
  ```

---

## Stats and Metrics

### Primer

Generates statistics about commit activity.

#### Makefile Target

```makefile
stats: ## Commits by the hour for the main author of this project
    @$(GIT) log --author="$(GIT_AUTHOR)" --date=iso | perl -nalE '...' 
```

- Processes Git logs to show commits per hour for the specified author.

### Examples

- **Generate Commit Stats**:

  ```bash
  $ make stats
  ```

---

## JWT Commands

### Primer

Handles JSON Web Token (JWT) operations for authentication.

#### Makefile Targets

```makefile
jwt-generate-keys: ## Generate the main JWT key set
    @mkdir -p config/jwt
    @openssl genpkey -out ./config/jwt/private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096
    @openssl pkey -in ./config/jwt/private.pem -out ./config/jwt/public.pem -pubout

jwt-create-ok: ## Create a JWT for a valid test account
    @curl -s POST -H "Content-Type: application/json" ${BASE_URL}${PORT}/api/login_check -d '{"username":"reader","password":"test"}' | jq .token | sed "s/\"//g"
```

- **jwt-generate-keys**: Generates RSA keys for JWT.
- **jwt-create-ok**: Obtains a JWT token for a valid user.

### Examples

- **Generate JWT Keys**:

  ```bash
  $ make jwt-generate-keys
  ```

- **Get JWT Token**:

  ```bash
  $ make jwt-create-ok
  ```

- **OpenSSL Commands**:

  ```bash
  $ openssl genpkey -out private.pem -aes256 -algorithm rsa -pkeyopt rsa_keygen_bits:4096
  $ openssl pkey -in private.pem -out public.pem -pubout
  ```

---

## Code Quality Reports

### Primer

Generates reports on code quality and test coverage.

#### Makefile Targets

```makefile
report-metrics: ## Run the phpmetrics report
    @$(PHPMETRICS) --report-html=var/phpmetrics/ src/

coverage: ## Create the code coverage report with PHPUnit
    $(EXEC_PHP) -d xdebug.enable=1 -d xdebug.mode=coverage -d memory_limit=-1 vendor/bin/phpunit --coverage-html=var/coverage
```

- **report-metrics**: Generates code metrics report.
- **coverage**: Generates test coverage report.

### Examples

- **Generate Metrics Report**:

  ```bash
  $ make report-metrics
  ```

- **Generate Coverage Report**:

  ```bash
  $ make coverage
  ```

- **PHPUnit Coverage Command**:

  ```bash
  $ php -d xdebug.mode=coverage vendor/bin/phpunit --coverage-html=var/coverage
  ```

---

## Best Practices

### Primer

To maximize the benefits of the Makefile:

- **Use `make help`**: Familiarize yourself with available targets.
- **Customize Variables**: Adjust settings like `HTTP_PORT` and `GIT_AUTHOR` to match your environment.
- **Extend the Makefile**: Add new targets for project-specific tasks.
- **Consistency**: Use the Makefile to ensure consistency across the team.

### Examples

- **Adding a New Target**:

  ```makefile
  backup-db: ## Backup the database
      @$(SYMFONY) doctrine:database:backup --file=backup.sql
  ```

- **Using the New Target**:

  ```bash
  $ make backup-db
  ```

---

## Conclusion

This guide provides a detailed primer on each section of the provided Makefile, explaining the tools and commands used. By understanding and utilizing these commands, you can automate repetitive tasks, maintain consistency, and improve productivity in your Symfony projects.

---

By following the examples and explanations provided, you can effectively leverage the Makefile to streamline your development workflow.
