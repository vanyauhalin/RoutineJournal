import Foundation
import ProjectDescription

private let root = FileManager.default.currentDirectoryPath

extension SourceFilesList {
  public static func relative(
    _ path: String,
    excluding: [Path] = []
  ) -> SourceFilesList {
    SourceFilesList(globs: [
      .glob(
        .relativeToManifest(path),
        excluding: excluding + ["Project.swift"]
      )
    ])
  }
}

extension ProjectDescription.ResourceFileElements {
  public static func relative(_ path: String) -> ResourceFileElements {
    ResourceFileElements(resources: [
      ResourceFileElement.glob(pattern: .relativeToManifest(path))
    ])
  }
}

extension ProjectDescription.TargetScript {
  private static let makefile = "\(root)/Makefile"

  public static func make(_ subcommand: String) -> TargetScript {
    .pre(
      script: "make -f \(makefile) \(subcommand)",
      name: "make \(subcommand)"
    )
  }

  public static func lint(_ project: String) -> TargetScript {
    .make("lint project=\(project)")
  }
}

extension ProjectDescription.TargetDependency {
  public static func project(_ target: String) -> TargetDependency {
    .project(target: target, path: .relativeToRoot(target))
  }
}
