import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "RoutineJournalCore",
  packages: [
    .remote(
      url: "https://github.com/realm/realm-swift",
      requirement: .exact("10.33.0")
    )
  ],
  targets: [
    Target(
      name: "RoutineJournalCore",
      platform: .iOS,
      product: .framework,
      bundleId: "my.vanyauhalin.RoutineJournalCore",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      sources: .relative("**/*.swift", excluding: [
        "**/*Tests.swift",
        "Project.swift"
      ]),
      scripts: [
        .make("lint-core")
      ],
      dependencies: [
        .package(product: "RealmSwift")
      ]
    ),
    Target(
      name: "RoutineJournalCoreTests",
      platform: .iOS,
      product: .unitTests,
      bundleId: "my.vanyauhalin.RoutineJournalCoreTests",
      sources: .relative("**/*Tests.swift"),
      dependencies: [
        .target(name: "RoutineJournalCore"),
        .xctest
      ]
    )
  ]
)
