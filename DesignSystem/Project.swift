import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "DesignSystem",
  targets: [
    .target(
      name: "DesignSystem",
      destinations: [.iPhone],
      product: .framework,
      bundleId: "\(Project.bundleId).DesignSystem",
      deploymentTargets: .iOS(Project.minimumDeploymentVersion),
      sources: ["Sources/**"],
      resources: nil,
      dependencies: [
        .composableArchitecture,
      ]
    ),
    .target(
      name: "DesignSystemTests",
      destinations: [.iPhone],
      product: .unitTests,
      bundleId: "\(Project.bundleId).DesignSystemTests",
      deploymentTargets: .iOS("17.0"),
      sources: ["Tests/**"],
      dependencies: [.target(name: "DesignSystem")]
    ),
  ]
)
