import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalMV",
  targets: [
    Target(
      name: "RoutineJournalMV",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalMV",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalMV")
      ]
    )
  ]
)
