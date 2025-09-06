// swift-tools-version: 6.0
import PackageDescription

#if TUIST
  import struct ProjectDescription.PackageSettings

  let packageSettings = PackageSettings(
    productTypes: [
      "ComposableArchitecture": .framework,
      "Alamofire": .framework,
    ]
  )
#endif

let package = Package(
  name: "TuistTCAProject",
  dependencies: [
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture.git",
      .upToNextMajor(from: "1.18.0")
    ),
    .package(
      url: "https://github.com/Alamofire/Alamofire",
      .upToNextMajor(from: "5.10.2")
    ),
    .package(
      url: "https://github.com/google/GoogleSignIn-iOS",
      .upToNextMajor(from: "8.0.0")
    ),
  ]
)
