//
//  Katana_SwiftUIApp.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import SwiftUI
import Katana

@main
struct Katana_SwiftUIApp: App {
  var store: AppStore = AppStore(interceptors: [], stateInitializer: AppState.init)
  
  var body: some Scene {
    WindowGroup {
      CounterView(viewModel: CounterViewModel(store: store))
    }
  }
}
