import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalSelectionModifier",
  targets: [
    Target(
      name: "RoutineJournalSelectionModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalSelectionModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalSelectionModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
