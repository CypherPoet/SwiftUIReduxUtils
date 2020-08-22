import Combine


/// Each Middleware is intended to receive a copy of our `State` and an `Action`,
/// and return a Combine Publisher containing a new `Action`, which can
/// be dispatched upon reception.
public typealias Middleware<State, Action> = (State, Action) -> AnyPublisher<Action, Never>?
