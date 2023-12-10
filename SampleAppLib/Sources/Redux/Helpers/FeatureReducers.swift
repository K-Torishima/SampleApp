//  Copyright © 2023 All Rights Reserved.

import Foundation

public protocol FeatureReducers: ReducerCreator {
    init()
}

public extension FeatureReducers {
    static var create: Reducer<State> {
        Self().asReducer
    }
}
