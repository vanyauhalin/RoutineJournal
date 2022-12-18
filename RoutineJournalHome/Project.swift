import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalHome",
  targets: [
    Target(
      name: "RoutineJournalHome",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalHome",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .make("lint-home")
      ],
      dependencies: [
        .project(
          target: "RoutineJournalCore",
          path: .relativeToRoot("RoutineJournalCore")
        ),
        .project(
          target: "RoutineJournalEventForm",
          path: .relativeToRoot("RoutineJournalEventForm")
        ),
        .project(
          target: "RoutineJournalTimeline",
          path: .relativeToRoot("RoutineJournalTimeline")
        ),
        .project(
          target: "RoutineJournalUI",
          path: .relativeToRoot("RoutineJournalUI")
        )
      ]
    )
  ]
)
