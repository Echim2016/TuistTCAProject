import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "GoogleService",
  targets: [
    .target(
      name: "GoogleService",
      destinations: [.iPhone],
      product: .framework,
      bundleId: "\(Project.bundleId).GoogleService",
      deploymentTargets: .iOS(Project.minimumDeploymentVersion),
      sources: ["Sources/**"],
      resources: nil,
      dependencies: [
        .composableArchitecture,
      ]
    ),
    .target(
      name: "GoogleServiceTests",
      destinations: [.iPhone],
      product: .unitTests,
      bundleId: "\(Project.bundleId).GoogleServiceTests",
      deploymentTargets: .iOS("17.0"),
      sources: ["Tests/**"],
      dependencies: [.target(name: "GoogleService")]
    ),
  ]
)
