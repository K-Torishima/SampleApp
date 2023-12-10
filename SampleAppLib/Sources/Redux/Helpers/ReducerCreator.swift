//  Copyright © 2023 All Rights Reserved.

import Foundation

/// Reducer を 作成できる型
public protocol ReducerCreator {
    associatedtype State: ReduxState
    var asReducer: Reducer<State> { get }
}

public extension ReducerCreator {
    /// 複数の Reducer を一つにまとめる
    /// - Parameter reducers: [Reducer<State>]
    /// - Returns: Reducer<State>
    static func reduce(_ reducers: [Reducer<State>]) -> Reducer<State> {
        { state, action in
            reducers.reduce(state) { state, reducerType in
                reducerType(state, action)
            }
        }
    }

    /// 複数の Reducer を一つにまとめる
    /// - Parameter reducers: Reducer<State>...
    /// - Returns: Reducer<State>
    static func reduce(_ reducers: Reducer<State>...) -> Reducer<State> {
        reduce(reducers)
    }

    /// アクションを処理する Reducer を作成する
    /// - Parameters:
    ///   - actionType: Action.Type
    ///   - receiveOn: アクションを受け取ったときに行う State の更新処理
    /// - Returns: Reducer<State>
    static func onAction<T: Action>(_ actionType: T.Type, _ receiveOn: @escaping @Sendable (inout State, T) -> Void) -> Reducer<State> {
        { state, action in
            if let action = action as? T {
                var state = state
                receiveOn(&state, action)
                return state
            } else {
                return state
            }
        }
    }
}

public extension ReducerCreator {
    /// 複数の Reducer を一つにまとめる
    /// - Parameter reducers: [Reducer<State>]
    /// - Returns: Reducer<State>
    func reduce(_ reducers: [Reducer<State>]) -> Reducer<State> {
        Self.reduce(reducers)
    }

    /// 複数の Reducer を一つにまとめる
    /// - Parameter reducers: Reducer<State>...
    /// - Returns: Reducer<State>
    func reduce(_ reducers: Reducer<State>...) -> Reducer<State> {
        Self.reduce(reducers)
    }

    /// アクションを処理する Reducer を作成する
    /// - Parameters:
    ///   - actionType: Action.Type
    ///   - receiveOn: アクションを受け取ったときに行う State の更新処理
    /// - Returns: Reducer<State>
    func onAction<T: Action>(_ actionType: T.Type, _ receiveOn: @escaping @Sendable (inout State, T) -> Void) -> Reducer<State> {
        Self.onAction(actionType, receiveOn)
    }
}
