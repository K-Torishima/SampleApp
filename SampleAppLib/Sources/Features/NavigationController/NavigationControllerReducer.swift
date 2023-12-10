//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

public struct NavigationControllerReducer<RouteState: NavigationControllerStateType>: FeatureReducers {
    public typealias State = RouteState

    public var asReducer: Reducer<RouteState> {
        reduce(
            navigationAction
        )
    }

    public init() {}

    private let navigationAction = onAction(NavigationControllerAction<RouteState>.self) { state, action in
        switch action {
        case .append(let component):
            state.path.append(component)
        case .pop:
            state.path.removeLast()
        case .popToRoot:
            state.path.removeAll()
        case .setPath(let path):
            state.path = path
        }
    }
}
