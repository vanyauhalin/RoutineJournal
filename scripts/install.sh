#!/bin/sh

set -e

tuist fetch

/usr/bin/xcrun \
	--sdk macosx \
	swift build \
		--package-path Tuist/Dependencies/SwiftPackageManager \
		--product swiftlint

tuist generate -n

xed RoutineJournal.xcworkspace
