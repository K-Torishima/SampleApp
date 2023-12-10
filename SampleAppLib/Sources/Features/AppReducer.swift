//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

@Sendable
public func appReducer(_ state: AppState, _ action: Action) -> AppState {
    var state = state
    
    state.navigationState = NavigationReducer.create(state.navigationState, action)
    
    return state
}
