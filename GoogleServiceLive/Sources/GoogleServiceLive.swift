//
//  GoogleService.swift
//  Home
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import Dependencies
import GoogleService
import GoogleSignIn

extension GoogleService: Dependencies.DependencyKey {
  public static var liveValue: GoogleService = .init { url in
    GIDSignIn.sharedInstance.handle(url)
  } restorePreviousSignIn: {
    try await withCheckedThrowingContinuation { continuation in
      GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
        if error == nil, user != nil {
          continuation.resume(returning: true)
        } else {
          continuation.resume(returning: false)
        }
      }
    }
  } signIn: { @MainActor in
    guard
      let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
      let rootViewController = scene.windows.first?.rootViewController
    else {
      throw GoogleSignInError.rootViewControllerNotFound
    }
    let result = try await GIDSignIn.sharedInstance.signIn(withPresenting: rootViewController)
    guard let idToken = result.user.idToken else {
      throw GoogleSignInError.userIdTokenNotFound
    }
    return idToken.tokenString
  } signOut: {
    GIDSignIn.sharedInstance.signOut()
  }
}
