//  Copyright © 2023 All Rights Reserved.

import Foundation

// TODO: https://developer.apple.com/documentation/swiftui/migrating-from-the-observable-object-protocol-to-the-observable-macro

@MainActor
public class Store<StoreState: ReduxState>: ObservableObject {
    private var reducer: Reducer<StoreState>
    @Published var state: StoreState
    private var middlewares: [Middleware<StoreState>]
    
    public init(
        reducer: @escaping Reducer<StoreState>,
        state: StoreState,
        middlewares: [Middleware<StoreState>] = []
    ) {
        self.reducer = reducer
        self.state = state
        self.middlewares = middlewares
    }
    
    public func addMiddleware(middleware: @escaping Middleware<StoreState>) {
        middlewares.append(middleware)
    }
    
    @Sendable public nonisolated func dispatch(action: Action) {
        Task { @MainActor in
            self.state = self.reducer(self.state, action)
        }
        Task { @MainActor in
            // run all middlewares
            middlewares.forEach { middleware in
                middleware(state, action, dispatch)
            }
        }
    }
}
