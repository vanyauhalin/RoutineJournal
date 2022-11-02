import Foundation
import ProjectDescription

public extension Project {
  static func configure(
    name: String? = nil,
    packages: [Package] = [],
    targets: [Target]
  ) -> Project {
    Project(
      name: "\(Project.name)\(name ?? "")",
      organizationName: Project.organizationName,
      packages: packages,
      targets: targets
    )
  }
}

extension Project {
  static let name = "RoutineJournal"
  static let organizationName = "my.vanyauhalin"
}

public extension Target {
  static func configureApp(name: String) -> Target {
    Target(
      name: configureName(),
      platform: .iOS,
      product: .app,
      bundleId: configureBundleId(),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(name: name),
      resources: .configure(name: name),
      scripts: [
        .configureSwiftLint()
      ]
    )
  }

  static func configureFramework(
    name: String,
    dependencies: [TargetDependency] = []
  ) -> Target {
    Target(
      name: configureName(name: name),
      platform: .iOS,
      product: .framework,
      bundleId: configureBundleId(name: name),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(name: name),
      scripts: [
        .configureSwiftLint()
      ],
      dependencies: dependencies
    )
  }
}

extension Target {
  static func configureName(name: String? = nil) -> String {
    "\(Project.name)\(name ?? "")"
  }

  static func configureBundleId(name: String? = nil) -> String {
    "\(Project.organizationName).\(Project.name)\(name ?? "")"
  }
}

extension ProjectDescription.DeploymentTarget {
  static func configure() -> ProjectDescription.DeploymentTarget {
    .iOS(targetVersion: "15.4", devices: .iphone)
  }
}

extension ProjectDescription.InfoPlist {
  static func configure() -> ProjectDescription.InfoPlist {
    .extendingDefault(with: [
      "UILaunchScreen": [:]
    ])
  }
}

extension SourceFilesList {
  static func configure(name: String) -> SourceFilesList {
    ["\(FileManager.default.currentDirectoryPath)/\(name)/Sources/**/*.swift"]
  }
}

extension ResourceFileElements {
  static func configure(name: String) -> ResourceFileElements {
    ["\(FileManager.default.currentDirectoryPath)/\(name)/Resources/**"]
  }
}

extension ProjectDescription.TargetScript {
  static func configureSwiftLint() ->
  ProjectDescription.TargetScript {
    .pre(
      script: "sh "
        + "\(FileManager.default.currentDirectoryPath)/scripts/swiftlint.sh",
      name: "SwiftLint"
    )
  }
}
