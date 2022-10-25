import ProjectDescription

let project = Project(
  name: "RoutineJournal",
  targets: [
    .init(
      name: "RoutineJournal",
      platform: .iOS,
      product: .app,
      bundleId: "com.vanyauhalin.RoutineJournal",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      scripts: [
        .pre(
          script: "sh ${PWD}/scripts/swiftlint.sh",
          name: "SwiftLint",
          basedOnDependencyAnalysis: true
        )
      ]
    )
  ]
)
