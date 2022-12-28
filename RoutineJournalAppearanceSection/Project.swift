import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalAppearanceSection",
  targets: [
    Target(
      name: "RoutineJournalAppearanceSection",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalAppearanceSection",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalAppearanceSection")
      ],
      dependencies: [
        .project("RoutineJournalColorThemePicker"),
        .project("RoutineJournalColorThemeSelectionModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalIconPicker"),
        .project("RoutineJournalIconSelectionModifier"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalTimeline"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
