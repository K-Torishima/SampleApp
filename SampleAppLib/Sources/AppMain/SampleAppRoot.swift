//  Copyright © 2023 All Rights Reserved.

import Redux
import SwiftUI
import Features
import View

/// ApplicationのRoot
@MainActor
public class SampleAppRoot {
    
    lazy var store: Store<AppState> = {
        let store = Store(
            reducer: appReducer,
            state: AppState(),
            middlewares: []
        )
        return store
    }()
    
    public var build: some View {
        ZStack {
            NavigationRoot()
        }
        .environmentObject(store)
    }
    
    public init() {}
}
