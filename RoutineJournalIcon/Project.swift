import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalIcon",
  targets: [
    Target(
      name: "RoutineJournalIcon",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalIcon",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalIcon")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
