import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoriesLink",
  targets: [
    Target(
      name: "RoutineJournalCategoriesLink",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoriesLink",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoriesLink")
      ],
      dependencies: [
        .project("RoutineJournalCategoryDetails"),
        .project("RoutineJournalCategoryForm"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
