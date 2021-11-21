//
//  File.swift
//  
//
//  Created by Michele Mola on 15/11/21.
//

import Katana

public enum Logic {}

public protocol AppStateUpdater: StateUpdater where StateType == AppState {}

protocol AppSideEffect: SideEffect where StateType == AppState, Dependencies == AppDependencies {}

typealias AppSideEffectContext = SideEffectContext<AppState, AppDependencies>

public typealias AppObservableViewModel = ObservableViewModel<AppState>
