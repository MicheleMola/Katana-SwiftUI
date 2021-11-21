//
//  Katana_SwiftUIApp.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import AppCore
import CounterHome
import SwiftUI

@main
struct Katana_SwiftUIApp: App {
  var store: AppStore = AppStore(interceptors: [], stateInitializer: AppState.init)
  
  var body: some Scene {
    WindowGroup {
      CounterHomeView(viewModel: CounterHomeViewModel(store: store))
    }
  }
}
