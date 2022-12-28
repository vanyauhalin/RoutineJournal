import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalFoundation",
  targets: [
    Target(
      name: "RoutineJournalFoundation",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalFoundation",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalFoundation")
      ]
    )
  ]
)
