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
      scripts: [
        .lintProject()
      ],
      dependencies: [
        .project(
          target: .name(by: "Timeline"),
          path: .relativeToRoot(.name(by: "Timeline"))
        )
      ]
    )
  ]
)
