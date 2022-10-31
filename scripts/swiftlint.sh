#!/bin/sh

set -e

lint_paths=${PWD}/$1

swiftlint() {
	/usr/bin/xcrun \
		--sdk macosx \
		swift run \
			--package-path ${PWD}/Tuist/Dependencies/SwiftPackageManager \
			--skip-build \
			swiftlint $1
}

if command -v $swiftlint > /dev/null; then
	swiftlint $lint_paths
else
	echo "warning: SwiftLint not installed"
fi
