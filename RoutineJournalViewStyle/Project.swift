import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalViewStyle",
  targets: [
    Target(
      name: "RoutineJournalViewStyle",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalViewStyle",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalViewStyle")
      ],
      dependencies: [
        .project("RoutineJournalMVI")
      ]
    )
  ]
)