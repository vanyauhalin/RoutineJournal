import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalTimeline",
  targets: [
    Target(
      name: "RoutineJournalTimeline",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalTimeline",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift", excluding: [
        "Project.swift"
      ]),
      scripts: [
        .make("lint-timeline")
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
    )
  ]
)
