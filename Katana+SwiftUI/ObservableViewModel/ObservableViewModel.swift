//
//  ObservableViewModel.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 19/08/20.
//

import Combine
import Katana

open class ObservableViewModel: ObservableObject {
	let store: AppStore
	
	public let objectWillChange = ObservableObjectPublisher()

	init(store: AppStore) {
		self.store = store
		
		self.update()
		self.setupListener()
	}
	
	private func setupListener() {
		let _ = store.addListener {
			self.update()
		}
	}
	
	private func update() {
		defer { self.objectWillChange.send() }
		
		self.updateView(state: self.store.state)
	}
	
	// Override to View updates
	func updateView(state: AppState) {}
}
