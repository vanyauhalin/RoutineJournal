import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalIconView",
  targets: [
    Target(
      name: "RoutineJournalIconView",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalIconView",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalIconView")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)