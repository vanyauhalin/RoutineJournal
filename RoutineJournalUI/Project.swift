import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalUI",
  targets: [
    Target(
      name: "RoutineJournalUI",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalUI",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [:]
      ]),
      sources: .relative("**/*.swift", excluding: [
        "**/*Tests.swift",
        "Project.swift"
      ]),
      scripts: [
        .make("lint-ui")
      ],
      dependencies: [
        .target(name: "RoutineJournalUIResources"),
        .project(
          target: "RoutineJournalCore",
          path: .relativeToRoot("RoutineJournalCore")
        )
      ]
    ),
    Target(
      name: "RoutineJournalUIResources",
      platform: .iOS,
      product: .bundle,
      bundleId: "my.vanyauhalin.RoutineJournalUIResources",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [:]
      ]),
      resources: "Resources/**"
    )
  ]
)
