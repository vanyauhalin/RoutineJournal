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
        .project("RoutineJournalColorThemePicker"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalIconPicker"),
        .project("RoutineJournalMVITextField"),
        .project("RoutineJournalNameField"),
        .project("RoutineJournalTimeline"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
