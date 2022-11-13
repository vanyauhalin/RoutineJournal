import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "Timeline"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "Timeline"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "Timeline"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintProject(by: "Timeline")
      ],
      dependencies: [
        .project(
          target: .name(by: "Event"),
          path: .relativeToRoot(.name(by: "Event"))
        )
      ]
    )
  ]
)
