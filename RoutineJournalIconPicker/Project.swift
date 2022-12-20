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
        .project("RoutineJournalCore"),
        .project("RoutineJournalIconView"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
