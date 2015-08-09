#!/usr/bin/env bash
#
# @author leodido - git.io/leodido - @leodido

set -e

cd "$(dirname "$(readlink -f "${BASH_SOURCE}")")"

getversionvars() {
	declare -a RESULTS=()
	declare -a VERSION_VARS=($(compgen -A variable | grep _VERSION))
	for VVAR in "${VERSION_VARS[@]}"; do
		NAME=$(echo ${VVAR} | cut -d '_' -f 1)
		NAME="${NAME,,}"
	done
}


