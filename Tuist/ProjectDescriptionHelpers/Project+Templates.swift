import Foundation
import ProjectDescription

let root = FileManager.default.currentDirectoryPath

extension SourceFilesList {
  public static func relative(_ path: String, excluding: [Path] = []) -> Self {
    SourceFilesList(globs: [
      .glob(.relativeToManifest(path), excluding: excluding)
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
