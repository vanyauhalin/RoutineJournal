import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalColorThemePicker",
  targets: [
    Target(
      name: "RoutineJournalColorThemePicker",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalColorThemePicker",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalColorThemePicker")
      ],
      dependencies: [
        .project("RoutineJournalColorThemeModifier"),
        .project("RoutineJournalColorThemeSelectionModifier"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
