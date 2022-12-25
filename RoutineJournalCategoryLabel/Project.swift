import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoryLabel",
  targets: [
    Target(
      name: "RoutineJournalCategoryLabel",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoryLabel",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoryLabel")
      ],
      dependencies: [
        .project("RoutineJournalCategoryModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalIconView"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
