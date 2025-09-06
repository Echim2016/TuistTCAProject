import ProjectDescription

let project = Project(
    name: "TuistTCAProject",
    targets: [
        .target(
            name: "TuistTCAProject",
            destinations: .iOS,
            product: .app,
            bundleId: "dev.tuist.TuistTCAProject",
            infoPlist: .extendingDefault(
                with: [
                    "UILaunchScreen": [
                        "UIColorName": "",
                        "UIImageName": "",
                    ],
                ]
            ),
            sources: ["TuistTCAProject/Sources/**"],
            resources: ["TuistTCAProject/Resources/**"],
            dependencies: []
        ),
        .target(
            name: "TuistTCAProjectTests",
            destinations: .iOS,
            product: .unitTests,
            bundleId: "dev.tuist.TuistTCAProjectTests",
            infoPlist: .default,
            sources: ["TuistTCAProject/Tests/**"],
            resources: [],
            dependencies: [.target(name: "TuistTCAProject")]
        ),
    ]
)
