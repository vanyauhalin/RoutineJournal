import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCategoryForm",
  targets: [
    Target(
      name: "RoutineJournalCategoryForm",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCategoryForm",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalCategoryForm")
      ],
      dependencies: [
        .project("RoutineJournalAppearanceSection"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalNameField"),
        .project("RoutineJournalCancellationModifier"),
        .project("RoutineJournalOnConfirmModifier"),
        .project("RoutineJournalUI"),
        .project("RoutineJournalViewStyle")
      ]
    )
  ]
)
