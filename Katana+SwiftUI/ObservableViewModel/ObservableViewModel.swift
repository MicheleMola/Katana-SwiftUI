//
//  ObservableViewModel.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 19/08/20.
//

import Combine
import Katana

/// This class keep updated the View exploiting the store listener.
/// Inherits this class to create the ViewModels and override the updateView(state: AppState) to update the SwiftUI View.
class ObservableViewModel<S: Katana.State>: ObservableObject {
  let store: PartialStore<S>
  
  init(store: PartialStore<S>) {
    self.store = store
    
    self.update(oldState: nil, newState: store.state)
    self.setupListener()
  }
  
  private func setupListener() {
    let _ = store.addListener { oldState, newState in
      self.update(oldState: oldState, newState: newState)
    }
  }
  
  private func update(oldState: S?, newState: S) {
    defer { self.objectWillChange.send() }
    
    self.updateView(oldState: oldState, newState: newState)
  }
  
  func updateView(oldState: S?, newState: S) {
    fatalError("Must be implemented.")
  }
}
