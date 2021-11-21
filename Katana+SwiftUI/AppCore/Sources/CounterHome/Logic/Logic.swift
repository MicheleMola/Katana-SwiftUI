//
//  File.swift
//  
//
//  Created by Michele Mola on 15/11/21.
//

import AppCore

extension Logic {
  enum Counter {}
}

extension Logic.Counter {
  public struct IncreaseCounter: AppStateUpdater {
    func updateState(_ state: inout AppState) {
      state.counter += 1
    }
  }
  
  public struct DecreaseCounter: AppStateUpdater {
    func updateState(_ state: inout AppState) {
      state.counter -= 1
    }
  }
}
