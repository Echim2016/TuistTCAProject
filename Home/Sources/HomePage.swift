//
//  HomePage.swift
//  Home
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import ComposableArchitecture
import DesignSystem
import GoogleService
import SwiftUI

@Reducer
public struct HomePage {
  @ObservableState
  public struct State: Equatable {
    var content: String
    var contentCards: IdentifiedArrayOf<DSContentCard.State>

    public init(
      content: String = "HomePage",
      contentCards _: IdentifiedArrayOf<DSContentCard.State> = []
    ) {
      self.content = content
      self.contentCards = .init(
        uniqueElements: [
          .init(title: "Card 1", content: "Content 1"),
          .init(title: "Card 2", content: "Content 2"),
        ]
      )
    }
  }

  public enum Action: BindableAction, ViewAction {
    case binding(BindingAction<State>)
    case contentCards(IdentifiedActionOf<DSContentCard>)
    case delegate(Delegate)
    case view(View)

    public enum Delegate {}

    public enum View {
      case onAppear
      case onGoogleSignInButtonTapped
    }
  }

  public init() {}
  
  @Dependency(\.googleService) var googleService

  public var body: some Reducer<State, Action> {
    BindingReducer()
    Reduce<State, Action> { _, action in
      switch action {
      case .binding:
        return .none
      case .contentCards:
        return .none
      case .delegate:
        return .none
      case .view(.onAppear):
        return .none
      case .view(.onGoogleSignInButtonTapped):
        return .run { send in 
          let idToken = try await googleService.signIn()
          print("idToken: \(idToken)")
        }
      }
    }
    .forEach(\.contentCards, action: \.contentCards) {
      DSContentCard()
    }
  }
}

@ViewAction(for: HomePage.self)
public struct HomePageView: View {
  @Bindable public var store: StoreOf<HomePage>

  public init(store: StoreOf<HomePage>) {
    self.store = store
  }

  public var body: some View {
    VStack {
      
      Button("Google Sign in ") {
        send(.onGoogleSignInButtonTapped)
      }
      

      ForEach(
        store.scope(state: \.contentCards, action: \.contentCards)
      ) { contentCardStore in
        DSContentCardView(store: contentCardStore)
      }
    }
    .onAppear {
      send(.onAppear)
    }
  }
}

#Preview {
  HomePageView(
    store: Store(
      initialState: HomePage.State()
    ) {
      HomePage()
    }
  )
}
