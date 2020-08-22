//
//  Reducer.swift
//
//  Created by CypherPoet on 10/30/19.
// ✌️
//

import Foundation


/// A pure function that computes the next version of `State`.
///
/// 📝 Reducers should be the only things responsible for mutating app state -- deterministically,
/// based upon the `Action` currently being received.
public struct Reducer<State, Action> {
    public let reduce: (inout State, Action) -> Void

    public init(reduce: @escaping (inout State, Action) -> Void) {
        self.reduce = reduce
    }
}
