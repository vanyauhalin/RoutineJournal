.PHONY: analyze claen help install lint

define absolute
	$(root)$(1)
endef

define lint
	if \
		! xcrun \
			--sdk macosx \
			swift run \
				--package-path $(package_path) \
				--skip-build \
					swiftlint lint \
						--config $(call absolute,.swiftlint.yml) \
						$(1) \
		2> /dev/null; \
	then \
		echo \
			"warning: SwiftLint not installed," \
			"execute \`make install\` at the root of the project."; \
	fi
endef

root := $(dir $(abspath $(MAKEFILE_LIST)))
package_path := $(call absolute,Tuist/Dependencies/SwiftPackageManager)
project :=

help:
	@echo "Welcome to RoutineJournal. <3"
	@echo ""
	@echo "Usage:"
	@echo "  $$ make <subcommand>"
	@echo "  $$ make <subcommand> [argument=value]"
	@echo ""
	@echo "Subcommands:"
	@echo "  analyze  Analyze projects via SwiftLint"
	@echo "  clean    Clean generated Tuist files except for dependencies"
	@echo "  help     Show this message"
	@echo "  install  Install dependencies and generate workspace via Tuist"
	@echo "  lint     Lint projects and Tuist directory via SwiftLint"
	@echo ""
	@echo "Arguments:"
	@echo "  project  Specify a project for the lint command"
	@echo ""
	@echo "Examples:"
	@echo "  $$ make help"
	@echo "  $$ make lint project=RoutineJournal"

analyze:
	@tuist generate -n
	@xcodebuild \
		-workspace $(call absolute,RoutineJournal.xcworkspace) \
		-scheme RoutineJournal \
		CODE_SIGN_IDENTITY="" \
		CODE_SIGNING_REQUIRED=NO \
		> $(call absolute,xcodebuild.log)
	@xcrun \
		--sdk macosx \
		swift run \
			--package-path $(package) \
			--skip-build \
				swiftlint analyze \
					--config $(call absolute,.swiftlint.yml) \
					--compiler-log-path $(call absolute,xcodebuild.log)

clean:
	@rm -f $(call absolute,xcodebuild.log)
	@find $(call absolute,*) \
		-name "Derived" \
		-maxdepth 1 \
		| xargs rm -rf
	@find $(call absolute,*) \
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
			--package-path $(package_path) \
			--product swiftlint

lint:
ifdef project
	@$(call lint,$(call absolute,$(project)))
else
	@for \
		project_path in \
		$$(find $(call absolute,*) \
			-name "RoutineJournal*" \
			! -name "RoutineJournal*.xc*" \
			-maxdepth 0); \
	do \
		$(call lint,$$project_path); \
	done
	@$(call lint,$(call absolute,Tuist))
endif
