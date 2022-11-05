import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "JCategory"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "JCategory"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "JCategory"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintSources(by: "JCategory")
      ],
      dependencies: [
        .project(
          target: .name(by: "UI"),
          path: .relativeToRoot("UI")
        )
      ]
    ),
    Target(
      name: .nameTests(by: "JCategory"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "JCategory"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      scripts: [
        .lintTests(by: "JCategory")
      ],
      dependencies: [
        .target(name: .name(by: "JCategory")),
        .xctest
      ]
    )
  ]
)
