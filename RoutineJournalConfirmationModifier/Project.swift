import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalConfirmationModifier",
  targets: [
    Target(
      name: "RoutineJournalConfirmationModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalConfirmationModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalConfirmationModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
