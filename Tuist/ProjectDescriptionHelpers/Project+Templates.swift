import Foundation
import ProjectDescription

extension Project {
  static let root = FileManager.default.currentDirectoryPath
  static let namePrefix = "RoutineJournal"
  static let organizationNamePrefix = "my.vanyauhalin"
}

public extension String {
  static func name() -> String{
    Project.namePrefix
  }

  static func name(by name: String) -> String {
    "\(Project.namePrefix)\(name)"
  }

  static func nameTests(by name: String) -> String {
    "\(Project.namePrefix)\(name)Tests"
  }

  static func organizationName() -> String {
    Project.organizationNamePrefix
  }

  static func bundleId() -> String {
    "\(Project.organizationNamePrefix).\(Project.namePrefix)"
  }

  static func bundleId(by name: String) -> String {
    "\(Project.organizationNamePrefix).\(Project.namePrefix)\(name)"
  }

  static func bundleIdTests(by name: String) -> String {
    "\(Project.organizationNamePrefix).\(Project.namePrefix)\(name)Tests"
  }
}

public extension ProjectDescription.Platform {
  static func configure() -> Platform {
    .iOS
  }
}

public extension ProjectDescription.DeploymentTarget {
  static func configure() -> ProjectDescription.DeploymentTarget {
    .iOS(targetVersion: "15.4", devices: .iphone)
  }
}

public extension ProjectDescription.InfoPlist {
  static func configure() -> ProjectDescription.InfoPlist {
    .extendingDefault(with: [
      "UILaunchScreen": [:]
    ])
  }
}

public extension SourceFilesList {
  static func configure() -> SourceFilesList {
    SourceFilesList.paths([.relativeToManifest("Sources/**/*.swift")])
  }

  static func tests() -> SourceFilesList {
    SourceFilesList.paths([.relativeToManifest("Tests/**/*.swift")])
  }
}

public extension ResourceFileElements {
  static func configure() -> ResourceFileElements {
    ResourceFileElements(resources: [
      ResourceFileElement.glob(pattern: .relativeToManifest("Resources/**"))
    ])
  }
}

public extension ProjectDescription.TargetScript {
  static func lintSources(by name: String) ->
  ProjectDescription.TargetScript {
    .pre(
      script: "sh "
        + "\(Project.root)/scripts/swiftlint.sh "
        + "\(Project.root)/\(name)/Sources",
      name: "Lint Sources"
    )
  }

  static func lintTests(by name: String) ->
  ProjectDescription.TargetScript {
    .pre(
      script: "sh "
        + "\(Project.root)/scripts/swiftlint.sh "
        + "\(Project.root)/\(name)/Tests",
      name: "Lint Sources"
    )
  }
}
