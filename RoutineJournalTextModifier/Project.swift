import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalTextModifier",
  targets: [
    Target(
      name: "RoutineJournalTextModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalTextModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalTextModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
