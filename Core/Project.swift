import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "Core"),
  organizationName: .organizationName(),
  packages: [
    .remote(
      url: "https://github.com/realm/realm-swift",
      requirement: .branch("master")
    )
  ],
  targets: [
    Target(
      name: .name(by: "Core"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "Core"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [.lintSources(by: "Core")],
      dependencies: [
        .package(product: "RealmSwift")
      ]
    )
  ]
)
