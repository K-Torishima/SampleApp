//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux
import SwiftUI
import Features

public struct NavigationModifier<R: Router, S: ReduxState, T: NavigationControllerStateType>: ViewModifier where R.RouteType == T.RouteType {
    
    @SelectState(\S.self) var state
    @UseDispatch(S.self, NavigationControllerActions<T>.self) private var navigationDispatch
    
    private let navigatonStateKeyPath: KeyPath<S, T>
    private let router: R
    
    
    public func body(content: Content) -> some View {
        let path: Binding<[T.RouteType]> = .init(
            get: { state[keyPath: navigatonStateKeyPath].path },
            set: { navigationDispatch(.setPath($0)) }
        )
        
        NavigationStack(path: path) {
            content
                .navigationDestination(for: R.RouteType.self) { route in
                    router.routing(route)
                }
        }
    }
    
    init(
        _ navigatonStateKeyPath: KeyPath<S, T>,
        router: R
    ) {
        self.navigatonStateKeyPath = navigatonStateKeyPath
        self.router = router
    }
}

public extension View {
    @MainActor
    func setNavigation<R: Router, T: NavigationControllerStateType>(_ navigatonStateKeyPath: KeyPath<some ReduxState, T>, router: R) -> some View where R.RouteType == T.RouteType {
        modifier(NavigationModifier(navigatonStateKeyPath, router: router))
    }
}
