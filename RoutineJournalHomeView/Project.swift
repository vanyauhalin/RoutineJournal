import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalHomeView",
  targets: [
    Target(
      name: "RoutineJournalHomeView",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalHomeView",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift"),
      scripts: [
        .lint("RoutineJournalHomeView")
      ],
      dependencies: [
        .project("RoutineJournalCategoryForm"),
        .project("RoutineJournalCore"),
        .project("RoutineJournalEventForm"),
        .project("RoutineJournalTimeline"),
        .project("RoutineJournalMVI"),
        .project("RoutineJournalUI")
      ]
    )
  ]
)
