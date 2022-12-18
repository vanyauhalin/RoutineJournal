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
        .project("RoutineJournalCore"),
        .project("RoutineJournalEventForm"),
        .project("RoutineJournalTimeline"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
