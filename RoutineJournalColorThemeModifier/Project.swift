import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalColorThemeModifier",
  targets: [
    Target(
      name: "RoutineJournalColorThemeModifier",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalColorThemeModifier",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalColorThemeModifier")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalMVI")
      ]
    )
  ]
)
