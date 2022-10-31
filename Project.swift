import ProjectDescription

let projectName = "RoutineJournal"
let projectOrganizationName = "my.vanyauhalin"
let project = Project(
  name: projectName,
  organizationName: projectOrganizationName,
  targets: [
    .configureAppTarget(name: "App")
  ]
)

extension Target {
  static func configureAppTarget(name: String) -> Target {
    .init(
      name: projectName,
      platform: .iOS,
      product: .app,
      bundleId: "\(projectOrganizationName).\(projectName)",
      deploymentTarget: .iOS(targetVersion: "15.4", devices: .iphone),
      infoPlist: .extendingDefault(with: [
        "UILaunchScreen": [:]
      ]),
      sources: ["Projects/\(name)/Sources/**/*.swift"],
      resources: ["Projects/\(name)/Resources/**"],
      scripts: [
        .pre(
          script: "sh scripts/swiftlint.sh",
          name: "SwiftLint"
        )
      ]
    )
  }
}
