//
//  GoogleService.swift
//  Home
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import Dependencies
import DependenciesMacros
import Foundation

@DependencyClient
public struct GoogleService {
  public var signInUrlHandler: @Sendable (URL) -> Bool = { _ in false }
  public var restorePreviousSignIn: @Sendable () async throws -> Bool
  public var signIn: @Sendable () async throws -> String
  public var signOut: @Sendable () async throws -> Void
}

public extension DependencyValues {
  var googleService: GoogleService {
    get { self[GoogleService.self] }
    set { self[GoogleService.self] = newValue }
  }
}

extension GoogleService: TestDependencyKey {
  public static var testValue = Self()
}

public enum GoogleSignInError: Error {
  case rootViewControllerNotFound
  case userIdTokenNotFound
}

