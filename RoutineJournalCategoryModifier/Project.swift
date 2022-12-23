import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoryModifier",
  targets: [
    Target(
      name: "RoutineJournalCategoryModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoryModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoryModifier")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
