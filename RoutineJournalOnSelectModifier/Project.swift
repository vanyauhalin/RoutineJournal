import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalOnSelectModifier",
  targets: [
    Target(
      name: "RoutineJournalOnSelectModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalOnSelectModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalOnSelectModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
