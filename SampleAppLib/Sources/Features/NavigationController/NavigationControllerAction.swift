//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

public enum NavigationControllerAction<RouteState: NavigationControllerStateType>: Action {
    case append(RouteState.RouteType)
    case pop
    case popToRoot
    case setPath([RouteState.RouteType])
}

public enum NavigationControllerActions<RouteState: NavigationControllerStateType>: FeatureActions {
    case append(RouteState.RouteType)
    case pop
    case popToRoot
    case setPath([RouteState.RouteType])

    public func action() -> Redux.Action {
        switch self {
        case .append(let routeType):
            return NavigationControllerAction<RouteState>.append(routeType)
        case .pop:
            return NavigationControllerAction<RouteState>.pop
        case .popToRoot:
            return NavigationControllerAction<RouteState>.popToRoot
        case .setPath(let routes):
            return NavigationControllerAction<RouteState>.setPath(routes)
        }
    }
}
