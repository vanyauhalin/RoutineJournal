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
      sources: .relative("**/*.swift"),
      scripts: [
        .make("lint-event-form")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalIcon"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
