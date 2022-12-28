import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalOnCancelModifier",
  targets: [
    Target(
      name: "RoutineJournalOnCancelModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalOnCancelModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalOnCancelModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
