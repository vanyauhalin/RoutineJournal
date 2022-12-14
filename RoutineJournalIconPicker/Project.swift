import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalIconPicker",
  targets: [
    Target(
      name: "RoutineJournalIconPicker",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalIconPicker",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalIconPicker")
      ],
      dependencies: [
        .project("RoutineJournalColorThemeModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalIconModifier"),
        .project("RoutineJournalIconSelectionModifier"),
        .project("RoutineJournalIconView"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalSelectionModifier"),
        .project("RoutineJournalQueryModifier"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
