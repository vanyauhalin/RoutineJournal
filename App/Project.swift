import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(),
      platform: .configure(),
      product: .app,
      bundleId: .bundleId(),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      resources: .configure(),
      scripts: [
        .lintSources(by: "App")
      ],
      dependencies: [
        .project(
          target: .name(by: "JEvent"),
          path: .relativeToRoot("JEvent")
        )
      ]
    )
  ]
)
