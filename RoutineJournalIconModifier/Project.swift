import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalIconModifier",
  targets: [
    Target(
      name: "RoutineJournalIconModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalIconModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalIconModifier")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
