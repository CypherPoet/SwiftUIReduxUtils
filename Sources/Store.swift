//
//  Store.swift
//
//  Created by CypherPoet on 8/21/20.
// ✌️
//

import Foundation
import Combine
import SwiftUI


public final class Store<AppState, AppAction>: ObservableObject {

    // Read-only access to app state
    @Published private(set) public var state: AppState

    public var tasks = [AnyCancellable]()
    public let serialQueue = DispatchQueue(label: "Redux Store Serial Queue")

    private var middlewareCancellables: Set<AnyCancellable> = []


    private let appReducer: Reducer<AppState, AppAction>
    public var middlewareRunners: [Middleware<AppState, AppAction>]


    // MARK: - Init
    public init(
        initialState: AppState,
        reducer: Reducer<AppState, AppAction>,
        middlewareRunners: [Middleware<AppState, AppAction>] = []
    ) {
        self.state = initialState
        self.appReducer = reducer
        self.middlewareRunners = middlewareRunners
    }
}


// MARK: - Send Actions and Side Effects
extension Store {

    /// Central hub for receiving an action and sending it to the `Store`'s app reducer
    /// for processing.
    public func dispatch(_ action: AppAction) {
        appReducer.reduce(&state, action)
    }


    /// Processes a side-effecting `AppAction`.
    ///
    /// After immediately dispatching the action to the `Store`'s app reducer,
    /// this function will iterate through all middlewares, running the side-effect
    /// action through each and then asynchronously dispatching any `AppAction`
    /// that results from doing so.
    public func send(_ sideEffectAction: AppAction) {
        dispatch(sideEffectAction)

        // Dispatch all middleware functions and dispatch any mapped actions
        // through the app's reducer.
        for runner in middlewareRunners {
            guard let appAction = runner(state, sideEffectAction) else { break }

            appAction
                .receive(on: DispatchQueue.main)
                .sink(receiveValue: { [weak self] appAction in
                    self?.dispatch(appAction)
                })
                .store(in: &middlewareCancellables)
        }
    }
}


// MARK: - Binding
extension Store {

    /// Generates a binding that dispatches a store
    /// action when its underlying value is changed.
    public func binding<Value>(
        for keyPath: KeyPath<AppState, Value>,
        onChange action: @escaping (Value) -> AppAction
    ) -> Binding<Value> {
        Binding<Value>(
            get: { self.state[keyPath: keyPath] },
            set: { self.dispatch(action($0)) }
        )
    }
}
