#!/bin/sh

set -e

tuist fetch
tuist generate
/usr/bin/xcrun \
	--sdk macosx \
	swift build \
		--package-path $PWD/Tuist/Dependencies/SwiftPackageManager \
		--product swiftlint
