import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalMVITextField",
  targets: [
    Target(
      name: "RoutineJournalMVITextField",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalMVITextField",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalMVITextField")
      ],
      dependencies: [
        .project("RoutineJournalCore"),
        .project("RoutineJournalFoundation")
      ]
    )
  ]
)
