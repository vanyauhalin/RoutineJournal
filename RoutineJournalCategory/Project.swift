import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "Category"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "Category"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "Category"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintProject(by: "Category")
      ],
      dependencies: [
        .project(
          target: .name(by: "UI"),
          path: .relativeToRoot(.name(by: "UI"))
        )
      ]
    ),
    Target(
      name: .nameTests(by: "Category"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "Category"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      dependencies: [
        .target(name: .name(by: "Category")),
        .xctest
      ]
    )
  ]
)
