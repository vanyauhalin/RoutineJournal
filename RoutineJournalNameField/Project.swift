import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalNameField",
  targets: [
    Target(
      name: "RoutineJournalNameField",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalNameField",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalNameField")
      ],
      dependencies: [
        .project("RoutineJournalFoundation"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalTextModifier"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
