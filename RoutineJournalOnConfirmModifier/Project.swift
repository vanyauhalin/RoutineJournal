import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalOnConfirmModifier",
  targets: [
    Target(
      name: "RoutineJournalOnConfirmModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalOnConfirmModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalOnConfirmModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
