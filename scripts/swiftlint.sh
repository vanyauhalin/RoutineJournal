#!/bin/sh

set -e

project_directory=$(realpath "$(dirname $0)/..")
lint_path=$1

swiftlint() {
	/usr/bin/xcrun \
		--sdk macosx \
		swift run \
			--package-path \
				$project_directory/Tuist/Dependencies/SwiftPackageManager \
			--skip-build \
			swiftlint lint \
				--config $project_directory/.swiftlint.yml \
				$1
}

if command -v $swiftlint > /dev/null; then
	swiftlint $lint_path
else
	echo "warning: SwiftLint not installed"
fi
