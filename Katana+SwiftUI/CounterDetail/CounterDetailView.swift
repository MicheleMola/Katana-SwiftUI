//
//  CounterDetailView.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 19/08/20.
//

import SwiftUI

class CounterDetailViewModel: ObservableViewModel {
	var counter = 0
	
	override func updateView(state: AppState) {
		self.counter = state.counter
	}
}

struct CounterDetailView: View {
	@ObservedObject var viewModel: CounterDetailViewModel

    var body: some View {
		VStack {
			Text("Value")
				.bold()
				.padding()
			
			Text("\(viewModel.counter)")
				.font(.title)
				.foregroundColor(.blue)
				.bold()
				.padding()
		}
    }
}

struct CounterDetailView_Previews: PreviewProvider {
	static let viewModel = CounterDetailViewModel(store: AppStore.init())
	
    static var previews: some View {
		CounterDetailView(viewModel: viewModel)
    }
}
