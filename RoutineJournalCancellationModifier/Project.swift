import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCancellationModifier",
  targets: [
    Target(
      name: "RoutineJournalCancellationModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCancellationModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCancellationModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
