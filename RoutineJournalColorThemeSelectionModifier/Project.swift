import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalColorThemeSelectionModifier",
  targets: [
    Target(
      name: "RoutineJournalColorThemeSelectionModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalColorThemeSelectionModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalColorThemeSelectionModifier")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
