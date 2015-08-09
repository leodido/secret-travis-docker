#!/bin/bash

set -e

cd "$(dirname "$(readlink -f "${BASH_SOURCE}")")"

main() {
	PHP_VERSION=${1:-${PHP_VERSION}}
	if [[ -z "${PHP_VERSION}" ]]; then
		echo -e "Please specifiy a php version ...\nExit."
		exit 1	
	fi
	local TEMP=versions/"phpcli${PHP_VERSION}"
	local DEST=${TEMP}
	mkdir -p ${TEMP}
	SUBST="s/{{php_version}}/${PHP_VERSION}/g;"
	if [[ -z "${MONGO_VERSION}" ]]; then
		SUBST=${SUBST}" s/{{mongo_version}}//g;"
	else
		SUBST=${SUBST}" s/{{mongo_version}}/-${MONGO_VERSION}/g;"
		DEST=${DEST}"-mongo${MONGO_VERSION}"
		
	fi
	if [[ -z "${XDEBUG_VERSION}" ]]; then
		SUBST=${SUBST}" s/{{xdebug_version}}//g"	
	else
		SUBST=${SUBST}" s/{{xdebug_version}}/-${XDEBUG_VERSION}/g"
		DEST=${DEST}"-xdebug${XDEBUG_VERSION}"
	fi
	
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
