import Foundation


public typealias Reduction<State, Action> = (State, Action) async -> State


public struct Reducer<State, Action> {
    public let reduce: Reduction<State, Action>

    public init(reduce: @escaping Reduction<State, Action>) {
        self.reduce = reduce
    }
}
