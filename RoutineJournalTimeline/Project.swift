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
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalTimeline")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalIcon"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
