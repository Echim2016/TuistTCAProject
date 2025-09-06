//
//  TargetDependency+Helpers.swift
//  Packages
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import ProjectDescription

public extension TargetDependency {
  // external
  static let composableArchitecture: TargetDependency = .external(name: "ComposableArchitecture")
  static let alamofire: TargetDependency = .external(name: "Alamofire")
  
  // project
  static let home: TargetDependency = .project(target: "Home", path: .relativeToRoot("Home"))
}

public extension Project {
  static let bundleId = "com.echim.TuistTCAProject"
  static let appName = "TuistTCAProject"
  static let minimumDeploymentVersion = "17.0"
  static let bundleVersion = "0.1.0"
  static let buildNumber = "1"
}
