//  Copyright © 2023 All Rights Reserved.

import SwiftUI
import Redux

public protocol NavigationControllerStateType: ReduxState {
    associatedtype RouteType: Route
    var path: [RouteType] { get set }
}

public struct NavigationControllerState<T: Route>: NavigationControllerStateType {
    public var path: [T] = []
    public init() {}
}
