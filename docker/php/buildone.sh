#!/usr/bin/env bash
#
# @author leodido - git.io/leodido - @leodido

set -e

cd "$(dirname "$(readlink -f "${BASH_SOURCE}")")"

main() {
	local PHP_VERSION=${1:-${PHP_VERSION}}
	if [[ -z "${PHP_VERSION}" ]]; then
		echo -e "Please specifiy a php version ...\nExit."
		exit 1	
	fi
	local TEMP=versions/"phpcli${PHP_VERSION}"
	mkdir -p ${TEMP}
	local DEST=${TEMP}
	local SUBST="s/{{php_version}}/${PHP_VERSION}/g;"
	
	[[ -z "${MONGO_VERSION+x}" ]] && DEST=$DEST SUBST=${SUBST}" s/{{mongo_version}}//g;" || DEST=${DEST}"-mongo${MONGO_VERSION}" SUBST=${SUBST}" s/{{mongo_version}}/-${MONGO_VERSION}/g;"
	[[ -z "${XDEBUG_VERSION+x}" ]] && DEST=$DEST SUBST=${SUBST}" s/{{xdebug_version}}//g;" || DEST=${DEST}"-xdebug${XDEBUG_VERSION}" SUBST=${SUBST}" s/{{xdebug_version}}/-${XDEBUG_VERSION}/g;"
	
	echo "Updating ${PHP_VERSION} ..."
	(
		set -x
		rm -rf "${TEMP}"/*
		cp -r template/* "${TEMP}"/
		sed -i -e "$SUBST" ${TEMP}/Dockerfile
		[[ ${TEMP} != ${DEST} ]] && mv ${TEMP} ${DEST}
	)
	
}

main "$@"
