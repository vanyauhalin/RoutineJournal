import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalQueryModifier",
  targets: [
    Target(
      name: "RoutineJournalQueryModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalQueryModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalQueryModifier")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
