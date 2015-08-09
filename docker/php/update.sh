#!/bin/bash

set -e

cd "$(dirname "$(readlink -f "${BASH_SOURCE}")")"

declare -a PHP_VERSIONS=("5.5" "5.6")
declare -a MONGO_VERSIONS=("1.4.5" "1.5.0" "1.5.1" "1.5.2" "1.5.3" "1.5.3" "1.5.5" "1.5.6" "1.5.7" "1.5.8" "1.6.0" "1.6.1" "1.6.2" "1.6.3" "1.6.4" "1.6.5" "1.6.6" "1.6.7" "1.6.8" "1.6.9")
declare -a XDEBUG_VERSIONS=("2.3.2")

for PHPV in "${PHP_VERSIONS[@]}"; do
	for MONGOV in "${MONGO_VERSIONS[@]}"; do
		for XDEBUGV in "${XDEBUG_VERSIONS[@]}"; do
     			echo "phpcli${PHPV}-mongo${MONGOV}-xdebug${XDEBUGV}"
		done
        done
done
