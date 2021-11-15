//
//  ContentView.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import SwiftUI
import Katana

class CounterViewModel: AppObservableViewModel {
  var counter = 0
  var title = "Counter"
  
  var decrementIsDisabled: Bool {
    counter == 0
  }
  
  override func updateView(oldState: AppState?, newState: AppState) {
    counter = newState.counter
  }
  
  func increment() {
    store.dispatch(Logic.Counter.IncreaseCounter())
  }
  
  func decrement() {
    store.dispatch(Logic.Counter.DecreaseCounter())
  }
}

struct CounterView: View {
  @StateObject var viewModel: CounterViewModel
  
  var body: some View {
    NavigationView {
      VStack {
        Button("Increment") {
          viewModel.increment()
        }
        .padding()
        .background(Color(.cyan))
        .foregroundColor(.black)
        .cornerRadius(16)
        .font(.body)
        
        Text("\(viewModel.counter)")
          .font(.title)
          .bold()
          .padding()
        
        Button("Decrement") {
          viewModel.decrement()
        }
        .disabled(viewModel.decrementIsDisabled)
        .padding()
        .background(Color(.orange))
        .foregroundColor(.black)
        .cornerRadius(16)
        .font(.body)
        .opacity(viewModel.decrementIsDisabled ? 0.5 : 1)
        
        NavigationLink(
          destination: CounterDetailView(viewModel: CounterDetailViewModel(store: viewModel.store))) {
            Text("Show detail view")
              .padding()
          }
          .navigationBarTitle(viewModel.title)
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
