import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: "App",
  targets: [
    .target(
      name: Project.appName,
      destinations: [.iPhone],
      product: .app,
      bundleId: Project.bundleId,
      deploymentTargets: .iOS(Project.minimumDeploymentVersion),
      infoPlist: .extendingDefault(
        with: [
          "UILaunchScreen": [
            "UIColorName": "",
            "UIImageName": "",
          ],
        ]
      ),
      sources: ["Sources/**"],
      resources: ["Resources/**"],
      dependencies: [
        .home,
      ]
    ),
    .target(
      name: "AppTests",
      destinations: [.iPhone],
      product: .unitTests,
      bundleId: "\(Project.bundleId)Tests",
      infoPlist: .default,
      sources: ["Tests/**"],
      resources: [],
      dependencies: [.target(name: Project.appName)]
    ),
  ]
)
