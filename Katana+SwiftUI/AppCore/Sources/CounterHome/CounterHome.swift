//
//  File.swift
//  
//
//  Created by Michele Mola on 15/11/21.
//

import AppCore
import CounterDetail
import SwiftUI

public class CounterHomeViewModel: AppObservableViewModel {
  var counter = 0
  var title = "Counter"
  
  var decrementIsDisabled: Bool {
    counter == 0
  }
  
  public override func updateView(oldState: AppState?, newState: AppState) {
    counter = newState.counter
  }
  
  func increment() {
    store.dispatch(Logic.Counter.IncreaseCounter())
  }
  
  func decrement() {
    store.dispatch(Logic.Counter.DecreaseCounter())
  }
}

public struct CounterHomeView: View {
  @StateObject var viewModel: CounterHomeViewModel
  
  public init(viewModel: CounterHomeViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  public var body: some View {
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
          destination: CounterDetailView(
            viewModel: CounterDetailViewModel(
              store: viewModel.store
            )
          )
        ) {
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
    CounterHomeView(viewModel: CounterHomeViewModel(store: store))
  }
}
