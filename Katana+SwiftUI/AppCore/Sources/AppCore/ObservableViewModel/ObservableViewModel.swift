//
//  File.swift
//  
//
//  Created by Michele Mola on 15/11/21.
//

import Combine
import Katana

/// This class keep updated the View exploiting the store listener.
/// Inherits this class to create the ViewModels and override the updateView(state: AppState) to update the SwiftUI View.
open class ObservableViewModel<S: Katana.State>: ObservableObject {
  public let store: PartialStore<S>
  
  public init(store: PartialStore<S>) {
    self.store = store
    
    self.update(oldState: nil, newState: store.state)
    self.setupListener()
  }
  
  private func setupListener() {
    let _ = store.addListener { [weak self] oldState, newState in
      self?.update(oldState: oldState, newState: newState)
    }
  }
  
  private func update(oldState: S?, newState: S) {
    defer { self.objectWillChange.send() }
    
    self.updateView(oldState: oldState, newState: newState)
  }
  
  open func updateView(oldState: S?, newState: S) {
    fatalError("Must be implemented.")
  }
}
