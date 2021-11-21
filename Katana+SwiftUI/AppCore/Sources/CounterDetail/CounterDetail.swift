//
//  File.swift
//  
//
//  Created by Michele Mola on 15/11/21.
//

import AppCore
import SwiftUI

public class CounterDetailViewModel: AppObservableViewModel {
  var counter = 0
  
  @Published var showingSheet = false
  
  @Published var showingAlert = false
  
  public override func updateView(oldState: AppState?, newState: AppState) {
    counter = newState.counter
  }
  
  var bannerColor: Color {
    isEven ? .orange : .green
  }
  
  var isEven: Bool {
    counter % 2 == 0
  }
  
  func increment() {
    store.dispatch(Logic.Counter.Detail.IncreaseCounter())
  }
  
  func showSheet() {
    showingSheet.toggle()
  }
  
  func showAlert() {
    showingAlert = true
  }
}

public struct CounterDetailView: View {
  @StateObject public var viewModel: CounterDetailViewModel
  
  public init(viewModel: CounterDetailViewModel) {
    self._viewModel = StateObject(wrappedValue: viewModel)
  }
  
  public var body: some View {
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
