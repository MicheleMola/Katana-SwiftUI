//
//  AppDependencies.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import Foundation
import Katana

/// The Container for the dependencies of the App
public class AppDependencies: SideEffectDependencyContainer {
  
  // The dispatch function that can be used to dispatch
  // SideEffects and State Updater
  let dispatch: AnyDispatch
  // A closure that returns the most updated version of the state
  let getState: GetState
  
  /// Initializer for the AppDependencies
  /// - parameter dispatch: the dispatch function that the dependencies must use
  /// - parameter getState: the closure that will return the most updated state
  required public init(
    dispatch: @escaping AnyDispatch,
    getState: @escaping GetState
  ) {
    self.dispatch = dispatch
    self.getState = getState
  }
}

