import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "JEvent"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "JEvent"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "JEvent"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintProject(by: "JEvent")
      ],
      dependencies: [
        .project(
          target: .name(by: "JCategory"),
          path: .relativeToRoot("JCategory")
        )
      ]
    ),
    Target(
      name: .nameTests(by: "JEvent"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "JEvent"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      dependencies: [
        .target(name: .name(by: "JEvent")),
        .xctest
      ]
    )
  ]
)
