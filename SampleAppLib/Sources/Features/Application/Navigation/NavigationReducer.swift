//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

public struct NavigationReducer: FeatureReducers {
    public typealias State = AppNavigationState
    
    public var asReducer: Reducer<AppNavigationState> {
        reduce(
            onSelectTabs,
            onNavigation
        )
    }
    
    private let onSelectTabs = onAction(SelectedTabs.self) { state, action in
        state.selectTab = action.payload
        print("[Tab]:", state.selectTab)
    }
    
    private let onNavigation = onAction(NavigationControllerAction<NavigationControllerState<AppRoutes>>.self) { state, action in
        switch state.selectTab {
        case .overview:
            state.overviewNavigation = NavigationControllerReducer.create(state.overviewNavigation, action)
        case .share:
            state.shareNavigation = NavigationControllerReducer.create(state.shareNavigation, action)
        case .browse:
            state.browseNavigation = NavigationControllerReducer.create(state.browseNavigation, action)
        }
    }
    
    public init() {}
}
