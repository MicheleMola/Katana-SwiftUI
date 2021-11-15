//
//  AppDispatchable.swift
//  Katana+SwiftUI
//
//  Created by Michele Mola on 18/08/20.
//

import Foundation
import Katana
import Combine

enum Logic {}

protocol AppStateUpdater: StateUpdater where StateType == AppState {}

protocol AppSideEffect: SideEffect where StateType == AppState, Dependencies == AppDependencies {}

typealias AppSideEffectContext = SideEffectContext<AppState, AppDependencies>

typealias AppObservableViewModel = ObservableViewModel<AppState>
