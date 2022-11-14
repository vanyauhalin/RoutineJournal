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

  static func nameResources(by name: String) -> String {
    "\(Project.namePrefix)\(name)Resources"
  }

  static func nameTests(by name: String) -> String {
    "\(Project.namePrefix)\(name)Tests"
  }

  static func organizationName() -> String {
    Project.organizationNamePrefix
  }

  static func bundleId() -> String {
    "\(Project.organizationNamePrefix).\(String.name())"
  }

  static func bundleId(by name: String) -> String {
    "\(Project.organizationNamePrefix).\(String.name(by: name))"
  }

  static func bundleIdResources(by name: String) -> String {
    "\(Project.organizationNamePrefix).\(String.nameResources(by: name))"
  }

  static func bundleIdTests(by name: String) -> String {
    "\(Project.organizationNamePrefix).\(String.nameTests(by: name))"
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
    SourceFilesList(globs: [.glob(
      .relativeToManifest("**/*.swift"),
      excluding: [
        "**/*Tests.swift",
        "Project.swift"
      ]
    )])
  }

  static func tests() -> SourceFilesList {
    SourceFilesList.paths([.relativeToManifest("**/*Tests.swift")])
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
  static func lintProject() -> ProjectDescription.TargetScript {
    .pre(
      script: "sh "
        + "\(Project.root)/scripts/swiftlint.sh "
        + "\(Project.root)/\(Project.namePrefix)",
      name: "Lint Project"
    )
  }

  static func lintProject(by name: String) -> ProjectDescription.TargetScript {
    .pre(
      script: "sh "
        + "\(Project.root)/scripts/swiftlint.sh "
        + "\(Project.root)/\(Project.namePrefix)\(name)",
      name: "Lint Project"
    )
  }
}
