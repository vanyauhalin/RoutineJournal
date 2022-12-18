import Foundation
import ProjectDescription

let root = FileManager.default.currentDirectoryPath

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
  public static func make(_ command: String) -> Self {
    .pre(
      script: "make -f \(root)/Makefile \(command)",
      name: "make \(command)"
    )
  }
}
