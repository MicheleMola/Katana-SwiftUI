//
//  CounterViewModel.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 19/08/20.
//

import Foundation
import Combine
import Katana

class CounterViewModel: ObservableViewModel {
	var counter = 0
	
	override func updateView(state: AppState) {
		self.counter = state.counter
	}
	
	func increment() {
		store.dispatch(Logic.Counter.IncreaseCounter())
	}
	
	func decrement() {
		store.dispatch(Logic.Counter.DecreaseCounter())
	}
}

