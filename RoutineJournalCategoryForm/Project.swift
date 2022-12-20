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
        .project("RoutineJournalIconPicker"),
        .project("RoutineJournalMVITextField"),
        .project("RoutineJournalTimeline"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)