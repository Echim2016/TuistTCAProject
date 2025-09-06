import ComposableArchitecture
import SwiftUI
import Home

@main
struct TuistTCAProjectApp: App {
  var body: some Scene {
    WindowGroup {
      HomePageView(
        store: Store(
          initialState: HomePage.State()
        ) {
          HomePage()
        }
      )
    }
  }
}
