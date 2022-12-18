import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournal",
  organizationName: "my.vanyauhalin",
  targets: [
    Target(
      name: "RoutineJournal",
      platform: .iOS,
      product: .app,
      bundleId: "my.vanyauhalin.RoutineJournal",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [:]
      ]),
      sources: .relative("**/*.swift"),
      scripts: [
        .make("lint-app")
      ],
      dependencies: [
        .project(
          target: "RoutineJournalCore",
          path: .relativeToRoot("RoutineJournalCore")
        ),
        .project(
          target: "RoutineJournalHome",
          path: .relativeToRoot("RoutineJournalHome")
        ),
        .project(
          target: "RoutineJournalUI",
          path: .relativeToRoot("RoutineJournalUI")
        )
      ]
    )
  ]
)
