import Foundation
import SwiftUI


@MainActor
public final class Store<AppState, AppAction>: ObservableObject {
    
    /// Read-only access to app state
    @Published
    private(set) public var state: AppState
    
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


// MARK: - Sending & Dispatching Side Effects & Actions
extension Store {
    
    /// Central hub for receiving an action and sending it to the `Store`'s app reducer
    /// for processing.
    public func dispatch(_ action: AppAction) async {
        state = await appReducer.reduce(state, action)
    }
    
    
    /// Processes a side-effecting `AppAction`.
    ///
    /// After immediately dispatching the action to the `Store`'s app reducer,
    /// this function will iterate through all middlewares, running the side-effect
    /// action through each and then asynchronously dispatching any `AppAction`
    /// that results from doing so.
    @discardableResult
    public func send(_ sideEffectAction: AppAction) async -> Task<Void, Never> {
        Task {
            await dispatch(sideEffectAction)
            
            // Dispatch all middleware functions and dispatch any mapped actions
            // through the app's reducer.
            for runner in middlewareRunners {
                guard let resultingAppActions = runner(state, sideEffectAction) else {
                    continue
                }
                
                for await appAction in resultingAppActions where Task.isCancelled == false {
                    await send(appAction)
                }
            }
        }
    }
}


// MARK: - Binding
extension Store {
    
    /// Generates a binding that dispatches a store
    /// action when its underlying value is changed.
    public func binding<Value>(
        for keyPath: KeyPath<AppState, Value>,
        reactingWith action: @escaping (Value) -> AppAction
    ) async -> Binding<Value> {
        Binding<Value>(
            get: {
                self.state[keyPath: keyPath]
            },
            set: { newValue in
                Task {
                    await self.dispatch(action(newValue))
                }
            }
        )
    }
}
