#!/usr/bin/env bash

run_phpcs() {

	if [[ $(vendor/bin/phpcs --version) ]]; then
		./vendor/bin/phpcs
  	elif [[ $(phpcs --version) ]]; then
		phpcs
	elif [[ $(composer --version) ]]; then

		echo -e "\\nℹ️ PHPCS could not be found locally or globally, but Composer is available."
		echo "🔄 Installing PHPCS through Composer..."

		composer global require "squizlabs/php_codesniffer=*"
		"$(composer global config home)"/vendor/bin/phpcs --version
		"$(composer global config home)"/vendor/bin/phpcs
  fi
}

run_phpcbf() {

	if [[ $(vendor/bin/phpcbf --version) ]]; then
		./vendor/bin/phpcbf
  	elif [[ $(phpcbf --version) ]]; then
		phpcbf
	elif [[ $(composer --version) ]]; then

		echo -e "\\nℹ️ PHPCBF could not be found locally or globally, but Composer is available."
		echo "🔄 Installing PHPCBF through Composer..."

		composer global require "squizlabs/php_codesniffer=*"
		"$(composer global config home)"/vendor/bin/phpcbf --version
		"$(composer global config home)"/vendor/bin/phpcbf
  fi
}

if [[ $1 == '--fix' ]]; then
	run_phpcbf
else
	run_phpcs
fi
