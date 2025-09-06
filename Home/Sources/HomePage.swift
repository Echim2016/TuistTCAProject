//
//  HomePage.swift
//  Home
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct HomePage {
  @ObservableState
  public struct State: Equatable {
    var content: String
    public init(content: String = "HomePage") {
      self.content = content
    }
  }
  
  public enum Action: ViewAction {
    case delegate(Delegate)
    case view(View)
    
    public enum Delegate {}
    
    public enum View {
      case onAppear
    }
  }
  
  public init() {}
  
  public var body: some Reducer<State, Action> {
    Reduce<State, Action> { state, action in
      switch action {
      case .delegate:
        return .none
      case .view(.onAppear):
        return .none
      }
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
      Text(store.content)
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
