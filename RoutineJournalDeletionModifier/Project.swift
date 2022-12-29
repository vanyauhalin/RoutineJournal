import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalDeletionModifier",
  targets: [
    Target(
      name: "RoutineJournalDeletionModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalDeletionModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalDeletionModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
