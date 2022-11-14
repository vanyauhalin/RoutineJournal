import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "UI"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "UI"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "UI"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintProject(by: "UI")
      ],
      dependencies: [
        .target(name: .nameResources(by: "UI")),
        .project(
          target: .name(by: "Core"),
          path: .relativeToRoot(.name(by: "Core"))
        )
      ]
    ),
    Target(
      name: .nameResources(by: "UI"),
      platform: .configure(),
      product: .bundle,
      bundleId: .bundleIdResources(by: "UI"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      resources: .configure()
    ),
    Target(
      name: .nameTests(by: "UI"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "UI"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      dependencies: [
        .target(name: .name(by: "UI")),
        .xctest
      ]
    )
  ]
)
