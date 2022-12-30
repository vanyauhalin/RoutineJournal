import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoryDetails",
  targets: [
    Target(
      name: "RoutineJournalCategoryDetails",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoryDetails",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoryDetails")
      ],
      dependencies: [
        .project("RoutineJournalAppearanceSection"),
        .project("RoutineJournalCancellationModifier"),
        .project("RoutineJournalCategoryLabel"),
        .project("RoutineJournalCategoryModifier"),
        .project("RoutineJournalConfirmationModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalDeletionModifier"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalNameField"),
        .project("RoutineJournalSelectionModifier"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
