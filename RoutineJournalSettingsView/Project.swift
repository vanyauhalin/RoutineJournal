import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalSettingsView",
  targets: [
    Target(
      name: "RoutineJournalSettingsView",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalSettingsView",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalSettingsView")
      ],
      dependencies: [
        .project("RoutineJournalUI")
      ]
    )
  ]
)
