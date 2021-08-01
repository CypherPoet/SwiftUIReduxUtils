import Foundation

public typealias Middleware<State, Action> = (State, Action) -> AsyncStream<Action>?
