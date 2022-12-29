import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoryPicker",
  targets: [
    Target(
      name: "RoutineJournalCategoryPicker",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoryPicker",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoryPicker")
      ],
      dependencies: [
        .project("RoutineJournalCategoryLabel"),
        .project("RoutineJournalCategoryModifier"),
        .project("RoutineJournalCategorySelectionModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalSelectionModifier"),
        .project("RoutineJournalQueryModifier"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
