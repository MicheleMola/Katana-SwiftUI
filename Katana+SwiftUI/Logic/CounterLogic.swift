//
//  CounterLogic.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import Foundation
import Katana

extension Logic {
  enum Counter {}
}

extension Logic.Counter {
  struct IncreaseCounter: AppStateUpdater {
    func updateState(_ state: inout AppState) {
      state.counter += 1
    }
  }
  
  struct DecreaseCounter: AppStateUpdater {
    func updateState(_ state: inout AppState) {
      state.counter -= 1
    }
  }
}
