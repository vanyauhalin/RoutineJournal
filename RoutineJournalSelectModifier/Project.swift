import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalSelectModifier",
  targets: [
    Target(
      name: "RoutineJournalSelectModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalSelectModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalSelectModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
