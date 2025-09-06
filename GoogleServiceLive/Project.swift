import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "GoogleServiceLive",
  settings: .settings(
    /// Run `tuist cache` after commenting out this line prevents the error:
    /// "@Dependency(\.googleService) has no live implementation, but was accessed from a live context."
    /// However, in our production apps, this line seems necessary for other packages to work properly.
//    base: ["OTHER_LDFLAGS": ["$(inherited) -ObjC"]]
  ),
  targets: [
    .target(
      name: "GoogleServiceLive",
      destinations: [.iPhone],
      product: .framework,
      bundleId: "\(Project.bundleId).GoogleServiceLive",
      deploymentTargets: .iOS(Project.minimumDeploymentVersion),
      sources: ["Sources/**"],
      resources: nil,
      dependencies: [
        .composableArchitecture,
        .googleService,
        .googleSignIn,
      ]
    ),
    .target(
      name: "GoogleServiceLiveTests",
      destinations: [.iPhone],
      product: .unitTests,
      bundleId: "\(Project.bundleId).GoogleServiceLiveTests",
      deploymentTargets: .iOS("17.0"),
      sources: ["Tests/**"],
      dependencies: [.target(name: "GoogleServiceLive")]
    ),
  ]
)
