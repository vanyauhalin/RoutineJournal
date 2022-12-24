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
        .project("RoutineJournalCategoryModifier"),
        .project("RoutineJournalCategorySelectionModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalIconView"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalQueryModifier"),
        .project("RoutineJournalSelectModifier"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
