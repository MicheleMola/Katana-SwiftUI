//
//  ContentView.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import SwiftUI
import Katana

struct CounterView: View {
	@ObservedObject var viewModel: CounterViewModel
		
    var body: some View {
		NavigationView {
			VStack {
				Button("Increase") {
					viewModel.increment()
				}
				.padding()
				.background(Color(.cyan))
				.foregroundColor(.black)
				.cornerRadius(16)
				.font(.body)
				
				Text("\(viewModel.counter)")
					.bold()
					.padding()

				Button("Decrease") {
					viewModel.decrement()
				}
				.padding()
				.background(Color(.orange))
				.foregroundColor(.black)
				.cornerRadius(16)
				.font(.body)
				
				NavigationLink(
					destination: CounterDetailView(viewModel: CounterDetailViewModel(store: viewModel.store))) {
					Text("Show detail view")
						.padding()
				}
				.navigationBarTitle("Counter")
			}
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var store: AppStore = AppStore(interceptors: [], stateInitializer: AppState.init)
	
    static var previews: some View {
		CounterView(viewModel: CounterViewModel(store: store))
    }
}
