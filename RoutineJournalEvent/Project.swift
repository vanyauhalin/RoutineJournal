import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: .name(by: "Event"),
  organizationName: .organizationName(),
  targets: [
    Target(
      name: .name(by: "Event"),
      platform: .configure(),
      product: .framework,
      bundleId: .bundleId(by: "Event"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .configure(),
      scripts: [
        .lintProject(by: "Event")
      ],
      dependencies: [
        .project(
          target: .name(by: "Category"),
          path: .relativeToRoot(.name(by: "Category"))
        )
      ]
    ),
    Target(
      name: .nameTests(by: "Event"),
      platform: .configure(),
      product: .unitTests,
      bundleId: .bundleIdTests(by: "Event"),
      deploymentTarget: .configure(),
      infoPlist: .configure(),
      sources: .tests(),
      dependencies: [
        .target(name: .name(by: "Event")),
        .xctest
      ]
    )
  ]
)
