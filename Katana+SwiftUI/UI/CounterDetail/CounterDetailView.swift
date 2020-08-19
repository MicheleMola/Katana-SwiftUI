//
//  CounterDetailView.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 19/08/20.
//

import SwiftUI

class CounterDetailViewModel: ObservableViewModel {
	var counter = 0
	
	var showingSheet = false {
		willSet {
			#warning("Workaround to reload View. @Published not working")
			self.objectWillChange.send()
		}
	}
	
	var showingAlert = false {
		willSet {
			#warning("Workaround to reload View. @Published not working")
			self.objectWillChange.send()
		}
	}
		
	var bannerColor: Color {
		isEven ? .orange : .green
	}
	
	var isEven: Bool {
		counter % 2 == 0
	}
	
	override func updateView(state: AppState) {
		self.counter = state.counter
	}
	
	func increment() {
		store.dispatch(Logic.Counter.IncreaseCounter())
	}
	
	func showSheet() {
		showingSheet.toggle()
	}
	
	func showAlert() {
		showingAlert.toggle()
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
						
			BannerView(viewModel: viewModel)
				.frame(height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
			
			
			Button("Show Alert") {
				viewModel.showAlert()
			}
			.alert(isPresented: $viewModel.showingAlert) {
				Alert(title: Text("Hello SwiftUI!"), message: Text("This is some detail message"), dismissButton: .default(Text("OK")))
			}
		}
    }
}

struct BannerView: View {
	@ObservedObject var viewModel: CounterDetailViewModel
		
	var body: some View {
		ZStack {
			viewModel.bannerColor
			
			VStack {
				Text(viewModel.isEven ? "Even" : "Odd")
					.bold()
				
				Button("Increment") {
					viewModel.increment()
				}
				.padding()
				.background(Color(.magenta))
				.foregroundColor(.white)
				
				Button("Show sheet") {
					viewModel.showSheet()
				}.sheet(isPresented: $viewModel.showingSheet) {
					EmptyView()
				}
			}
		}
	}
}

struct CounterDetailView_Previews: PreviewProvider {
	static let viewModel = CounterDetailViewModel(store: AppStore.init())
	
    static var previews: some View {
		CounterDetailView(viewModel: viewModel)
    }
}
