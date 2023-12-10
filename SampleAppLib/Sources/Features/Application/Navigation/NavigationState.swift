//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

public enum Tabs: Hashable, Sendable {
    case overview
    case share
    case browse
}

public enum AppRoutes: Route {
    // 遷移先を網羅する
    // case detail
}

public typealias OverviewNavigationState = NavigationControllerState<AppRoutes>
public typealias ShareNavigationState = NavigationControllerState<AppRoutes>
public typealias BrowseNavigationState = NavigationControllerState<AppRoutes>

public struct AppNavigationState: ReduxState {
    // TabState
    public var selectTab: Tabs = .overview
    
    // AppNavigationStates
    public var overviewNavigation: OverviewNavigationState = .init()
    public var shareNavigation: ShareNavigationState = .init()
    public var browseNavigation: BrowseNavigationState = .init()
    
    public init() {}
}
