#!/bin/sh
set -e

if [ "$1" = 'frankenphp' ] || [ "$1" = 'php' ] || [ "$1" = 'bin/console' ]; then
	# Install the project the first time PHP is started
	# After the installation, the following block can be deleted
	#if [ ! -f composer.json ]; then
	#	rm -Rf tmp/
	#	composer create-project "symfony/skeleton $SYMFONY_VERSION" tmp --stability="$STABILITY" --prefer-dist --no-progress --no-interaction --no-install
	#
	#	cd tmp
	#	cp -Rp . ..
	#	cd -
	#	rm -Rf tmp/
#
#		composer require "php:>=$PHP_VERSION" runtime/frankenphp-symfony
##
#		if grep -q ^DATABASE_URL= .env; then
#			echo "To finish the installation please press Ctrl+C to stop Docker Compose and run: docker compose up --build -d --wait"
#			sleep infinity
#		fi
#	fi

	if [ -z "$(ls -A 'vendor/' 2>/dev/null)" ]; then
#	if ! find vendor/ -mindepth 1 | read; then
		composer install --prefer-dist --no-progress --no-interaction
	fi

	DIR_VAR="var/"
	if [ -d "$DIR_VAR" ]; then
		# echo "DIR_VAR '$DIR_VAR' exists."
		#mkdir -p var/
		#setfacl -R -m u:www-data:rwX -m u:"$(whoami)":rwX var
		#setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX var
	else
		# echo "DIR_VAR '$DIR_VAR' does not exist."
	fi


	DIR_TAILWIND="var/tailwind/"
	if [ -d "$DIR_TAILWIND" ]; then
		# echo "DIR_TAILWIND '$DIR_TAILWIND' exists."
		#mkdir -p var/tailwind
		#setfacl -R -m u:www-data:rwX -m u:"$(whoami)":rwX var/tailwind
		#setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX var/tailwind
	else
		# echo "DIR_TAILWIND '$DIR_TAILWIND' does not exist."
	fi

# ---------------------------------------------------------------------------------------------------------------------------
# don't need this here - symfony-x2 will have DB support
# leaving for now - i tend to comment out instead of delete

#	if grep -q ^DATABASE_URL= .env; then
#		echo "Waiting for database to be ready..."
#		ATTEMPTS_LEFT_TO_REACH_DATABASE=60
#		until [ $ATTEMPTS_LEFT_TO_REACH_DATABASE -eq 0 ] || DATABASE_ERROR=$(php bin/console dbal:run-sql -q "SELECT 1" 2>&1); do
#			if [ $? -eq 255 ]; then
#				# If the Doctrine command exits with 255, an unrecoverable error occurred
#				ATTEMPTS_LEFT_TO_REACH_DATABASE=0
#				break
#			fi
#			sleep 1
#			ATTEMPTS_LEFT_TO_REACH_DATABASE=$((ATTEMPTS_LEFT_TO_REACH_DATABASE - 1))
#			echo "Still waiting for database to be ready... Or maybe the database is not reachable. $ATTEMPTS_LEFT_TO_REACH_DATABASE attempts left."
#		done

#		if [ $ATTEMPTS_LEFT_TO_REACH_DATABASE -eq 0 ]; then
#			echo "The database is not up or not reachable:"
#			echo "$DATABASE_ERROR"
#			exit 1
#		else
#			echo "The database is now ready and reachable"
#		fi
#
#		if [ "$( find ./migrations -iname '*.php' -print -quit )" ]; then
#			php bin/console doctrine:migrations:migrate --no-interaction --all-or-nothing
#		fi
#	fi
# ---------------------------------------------------------------------------------------------------------------------------



	# these are probably superfluous - just in case
	setfacl -R -m u:www-data:rwX -m u:"$(whoami)":rwX var
	setfacl -dR -m u:www-data:rwX -m u:"$(whoami)":rwX var

	# Start Tailwind CSS build process in the background
	# NOPE! Think i'll go another way - but leaving this here for now
	# php bin/console tailwind:build --watch &
fi

exec docker-php-entrypoint "$@"
