# CLI Cheat Sheet for the Strangebuzz Symfony Makefile

This cheat sheet provides a quick reference to the Makefile commands available in your project. Use `make <target>` to execute a specific command.

---

## General Commands

- **help**: Outputs this help screen.
  ```sh
  make help
  ```

---

## Composer 🧙‍♂️

- **install**: Install vendors according to the current `composer.lock` file.
  ```sh
  make install
  ```

---

## PHP 🐘 (macOS with Homebrew)

- **php-upgrade**: Upgrade PHP to the latest version.
  ```sh
  make php-upgrade
  ```

- **php-set-8-1**: Set PHP 8.1 as the current PHP version.
  ```sh
  make php-set-8-1
  ```

- **php-set-8-2**: Set PHP 8.2 as the current PHP version.
  ```sh
  make php-set-8-2
  ```

- **php-set-8-3**: Set PHP 8.3 as the current PHP version.
  ```sh
  make php-set-8-3
  ```

---

## Symfony 🎵

- **sf**: List all Symfony commands.
  ```sh
  make sf
  ```

- **cc**: Clear the cache.
  ```sh
  make cc
  ```

- **warmup**: Warm up the cache.
  ```sh
  make warmup
  ```

- **fix-perms**: Fix permissions of all `var` files.
  ```sh
  make fix-perms
  ```

- **assets**: Install assets with symlinks in the public folder.
  ```sh
  make assets
  ```

- **purge**: Purge cache and logs.
  ```sh
  make purge
  ```

---

## Symfony Binary 💻

- **cert-install**: Install local HTTPS certificates.
  ```sh
  make cert-install
  ```

- **serve**: Serve the application with HTTPS support.
  ```sh
  make serve
  ```

- **unserve**: Stop the web server.
  ```sh
  make unserve
  ```

---

## Elasticsearch 🔎

- **populate**: Reset and populate the Elasticsearch index.
  ```sh
  make populate
  ```

- **list-index**: List all indexes on the cluster.
  ```sh
  make list-index
  ```

- **delete-index**: Delete a specified index.
  ```sh
  make delete-index index=<index_name>
  ```

---

## Docker 🐳

- **up**: Start the Docker hub (PHP, Caddy, MySQL, Redis, Adminer, Elasticsearch).
  ```sh
  make up
  ```

- **build**: Build the Docker images (PHP and Caddy).
  ```sh
  make build
  ```

- **down**: Stop the Docker hub.
  ```sh
  make down
  ```

- **check**: Perform a Docker check to ensure containers are running and healthy.
  ```sh
  make check
  ```

- **sh**: Log into the Docker container.
  ```sh
  make sh
  ```

- **logs**: Show live Docker logs.
  ```sh
  make logs
  ```

- **wait-for-mysql**: Wait for MySQL to be ready.
  ```sh
  make wait-for-mysql
  ```

- **wait-for-elasticsearch**: Wait for Elasticsearch to be ready.
  ```sh
  make wait-for-elasticsearch
  ```

- **bash**: Connect to the application container via Bash.
  ```sh
  make bash
  ```

---

## Project Management 🐝

- **start**: Start Docker, load fixtures, populate Elasticsearch index, and start the web server.
  ```sh
  make start
  ```

- **reload**: Load fixtures and repopulate the Meilisearch index.
  ```sh
  make reload
  ```

- **stop**: Stop Docker and the Symfony web server.
  ```sh
  make stop
  ```

- **cc-redis**: Flush all Redis cache.
  ```sh
  make cc-redis
  ```

- **commands**: Display all commands in the project namespace.
  ```sh
  make commands
  ```

- **load-fixtures**: Build the database, validate the schema, load fixtures, and check migration status.
  ```sh
  make load-fixtures
  ```

- **init-snippet**: Initialize a new code snippet.
  ```sh
  make init-snippet
  ```

---

## Testing ✅

- **test**: Run tests with optional suite and filter.
  ```sh
  make test testsuite=<suite_name> filter=<pattern>
  ```
  - Default `testsuite` is `'all'`.
  - Default `filter` is `'.'`.

- **test-all**: Run all tests.
  ```sh
  make test-all
  ```

---

## Coding Standards ✨

- **cs**: Run all coding standards checks.
  ```sh
  make cs
  ```

- **static-analysis**: Run static analysis using PHPStan.
  ```sh
  make static-analysis
  ```

- **stan**: Run PHPStan analysis.
  ```sh
  make stan
  ```

- **lint-php**: Lint PHP files with PHP-CS-Fixer.
  ```sh
  make lint-php
  ```

- **fix-php**: Fix PHP files with PHP-CS-Fixer.
  ```sh
  make fix-php
  ```

---

## Deployment & Production 🚀

- **deploy**: Perform a full no-downtime deployment with EasyDeploy.
  ```sh
  make deploy
  ```

- **env-check**: Check the main environment variables of the project.
  ```sh
  make env-check
  ```

- **le-renew**: Renew Let's Encrypt HTTPS certificates.
  ```sh
  make le-renew
  ```

---

## Yarn 🐱 / JavaScript

- **dev**: Rebuild assets for the development environment.
  ```sh
  make dev
  ```

- **watch**: Watch files and build assets when they change in the development environment.
  ```sh
  make watch
  ```

- **encore**: Build assets for production.
  ```sh
  make encore
  ```

- **lint-js**: Lint JavaScript coding standards.
  ```sh
  make lint-js
  ```

- **fix-js**: Fix JavaScript files.
  ```sh
  make fix-js
  ```

---

## Statistics 📜

- **stats**: Display commits by the hour for the main author of this project.
  ```sh
  make stats
  ```

---

## JWT 🕸

- **jwt-generate-keys**: Generate the main JWT key set.
  ```sh
  make jwt-generate-keys
  ```

- **jwt-create-ok**: Create a JWT for a valid test account.
  ```sh
  make jwt-create-ok
  ```

- **jwt-create-nok**: Attempt to login with incorrect credentials.
  ```sh
  make jwt-create-nok
  ```

- **jwt-test**: Test a JWT token to access an API Platform resource.
  ```sh
  make jwt-test
  ```

---

## Code Quality Reports 📊

- **report-metrics**: Run the PHP Metrics report.
  ```sh
  make report-metrics
  ```

- **coverage**: Generate the code coverage report with PHPUnit.
  ```sh
  make coverage
  ```

---

**Note**: Replace placeholders like `<suite_name>`, `<pattern>`, and `<index_name>` with actual values when running the commands.
