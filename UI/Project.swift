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
        .lintSources(by: "UI")
      ],
      dependencies: [
        .project(
          target: .name(by: "Core"),
          path: .relativeToRoot("Core")
        )
      ]
    ),
    Target(
      name: .nameTests(by: "UI"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "UI"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      scripts: [
        .lintTests(by: "UI")
      ],
      dependencies: [
        .target(name: .name(by: "UI")),
        .xctest
      ]
    )
  ]
)
