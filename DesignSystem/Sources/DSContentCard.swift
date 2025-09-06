//
//  DSContentCard.swift
//  Home
//
//  Created by Yi-Chin Hsu on 2025/9/6.
//

import ComposableArchitecture
import SwiftUI

@Reducer
public struct DSContentCard {
  @ObservableState
  public struct State: Equatable, Identifiable {
    public var id: String {
      "\(title)\(content)"
    }
    public var title: String
    public var content: String
    
    public init(title: String, content: String) {
      self.title = title
      self.content = content
    }
  }
  
  public enum Action: ViewAction {
    case delegate(Delegate)
    case view(View)
    
    public enum Delegate {}
    
    public enum View {
      case onAppear
      case onTitleTap
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
      case .view(.onTitleTap):
        return .none
      }
    }
  }
}


@ViewAction(for: DSContentCard.self)
public struct DSContentCardView: View {
  @Bindable public var store: StoreOf<DSContentCard>
  
  public init(store: StoreOf<DSContentCard>) {
    self.store = store
  }
  
  public var body: some View {
    VStack {
      Text(store.title)
        .font(.title)
        .onTapGesture {
          send(.onTitleTap)
        }
      Text(store.content)
        .font(.body)
    }
  }
}

#Preview {
  DSContentCardView(
    store: Store(
      initialState: DSContentCard.State(
        title: "title",
        content: "content"
      )
    ) {
      DSContentCard()
    }
  )
}
