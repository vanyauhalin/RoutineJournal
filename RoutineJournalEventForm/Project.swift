import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalEventForm",
  targets: [
    Target(
      name: "RoutineJournalEventForm",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalEventForm",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [:]
      ]),
      sources: .relative("**/*.swift", excluding: [
        "**/*Tests.swift",
        "Project.swift"
      ]),
      scripts: [
        .make("lint-event-form")
      ],
      dependencies: [
        .project(
          target: "RoutineJournalCore",
          path: .relativeToRoot("RoutineJournalCore")
        ),
        .project(
          target: "RoutineJournalIcon",
          path: .relativeToRoot("RoutineJournalIcon")
        ),
        .project(
          target: "RoutineJournalUI",
          path: .relativeToRoot("RoutineJournalUI")
        )
      ]
    ),
    Target(
      name: "RoutineJournalEventFormTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "my.vanyauhalin.RoutineJournalEventFormTests",
      sources: .relative("**/*Tests.swift"),
      dependencies: [
        .target(name: "RoutineJournalEventForm"),
        .xctest
      ]
    )
  ]
)
