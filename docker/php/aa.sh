#!/usr/bin/env bash
#
# @author leodido - git.io/leodido - @leodido

set -e

cd "$(dirname "$(readlink -f "${BASH_SOURCE}")")"

declare -a VERSION_VARS=($(compgen -A variable | grep _VERSION))

for VVAR in "${VERSION_VARS[@]}"; do
	echo "${VVAR} ..."
	NAME=$(echo ${VVAR} | cut -d '_' -f 1)
	echo ${NAME}
done

echo "ciao"
