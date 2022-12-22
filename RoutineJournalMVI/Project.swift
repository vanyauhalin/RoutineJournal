import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalMVI",
  targets: [
    Target(
      name: "RoutineJournalMVI",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalMVI",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalMVI")
      ]
    )
  ]
)
