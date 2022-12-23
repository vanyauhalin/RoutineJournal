import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategorySelectionModifier",
  targets: [
    Target(
      name: "RoutineJournalCategorySelectionModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategorySelectionModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategorySelectionModifier")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
