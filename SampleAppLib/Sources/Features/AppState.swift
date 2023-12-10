//  Copyright © 2023 All Rights Reserved.

import Common
import Redux

public struct AppState: ReduxState {
    // impl
    public var navigationState: AppNavigationState = .init()
    
    public init() {}
    
}

// あとやること
// Navigationのコントロールができるようにする
// SelectStateとUseDispathのようなものを作ってViewで使えるようにする


