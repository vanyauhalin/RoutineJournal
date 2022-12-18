.PHONY: \
	analyze \
	claen \
	help \
	install \
	lint \
	lint-app \
	lint-core \
	lint-event-form \
	lint-home \
	lint-icon \
	lint-timeline \
	lint-tuist \
	lint-ui

root := $(dir $(abspath $(MAKEFILE_LIST)))
package := $(root)Tuist/Dependencies/SwiftPackageManager

define lint
	if \
		! xcrun \
			--sdk macosx \
			swift run \
				--package-path $(package) \
				--skip-build \
					swiftlint lint \
						--config $(root).swiftlint.yml \
						$(root)$(1) \
		2> /dev/null; \
	then \
		echo \
			"warning: SwiftLint not installed," \
			"execute \`make install\` at the root of the project."; \
	fi
endef

help:
	@echo "Welcome to RoutineJournal. <3"
	@echo ""
	@echo "Commands:"
	@echo "  analyze  Analyze projects via SwiftLint"
	@echo "  clean    Clean generated Tuist files except for dependencies"
	@echo "  help     Show this message"
	@echo "  install  Install dependencies and generate workspace via Tuist"
	@echo "  lint     Lint projects and Tuist directory via SwiftLint"

analyze:
	@tuist generate -n
	@xcodebuild \
		-workspace $(root)RoutineJournal.xcworkspace \
		-scheme RoutineJournal \
		CODE_SIGN_IDENTITY="" \
		CODE_SIGNING_REQUIRED=NO \
		> $(root)xcodebuild.log
	@xcrun \
		--sdk macosx \
		swift run \
			--package-path $(package) \
			--skip-build \
				swiftlint analyze \
					--config $(root).swiftlint.yml \
					--compiler-log-path $(root)xcodebuild.log

clean:
	@rm -f $(root)xcodebuild.log
	@find $(root)* \
		-name "Derived" \
		-maxdepth 1 \
		| xargs rm -rf
	@find $(root)* \
		-name "RoutineJournal*.xc*" \
		-maxdepth 1 \
		| xargs rm -rf

install:
	@if ! command -v tuist > /dev/null; then \
		echo \
			"Tuist is not installed," \
			"see https://tuist.io for how to install it."; \
		exit 1; \
	fi
	@tuist fetch
	@tuist generate
	@xcrun \
		--sdk macosx \
		swift build \
			--package-path $(package) \
			--product swiftlint

lint:
	@make \
		lint-app \
		lint-core \
		lint-event-form \
		lint-home \
		lint-icon \
		lint-timeline \
		lint-tuist \
		lint-ui

lint-app:
	@$(call lint,RoutineJournal)

lint-core:
	@$(call lint,RoutineJournalCore)

lint-event-form:
	@$(call lint,RoutineJournalEventForm)

lint-home:
	@$(call lint,RoutineJournalHome)

lint-icon:
	@$(call lint,RoutineJournalIcon)

lint-timeline:
	@$(call lint,RoutineJournalTimeline)

lint-tuist:
	@$(call lint,Tuist)

lint-ui:
	@$(call lint,RoutineJournalUI)
