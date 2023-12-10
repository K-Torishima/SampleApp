//  Copyright © 2023 All Rights Reserved.

import Foundation
import Redux

struct SelectedTabs: PayloadAction {
    typealias Payload = Tabs
    let payload: Payload
    init(_ payload: Payload) {
        self.payload = payload
    }
}

public enum NavigationActions: FeatureActions {
    case selectTab(Tabs)
    public func action() -> Action {
        switch self {
        case .selectTab(let tab):
            SelectedTabs(tab)
        }
    }
}
