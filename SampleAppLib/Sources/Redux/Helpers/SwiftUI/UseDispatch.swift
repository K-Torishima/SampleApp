//  Copyright © 2023 All Rights Reserved.

import Foundation
import SwiftUI

@propertyWrapper
public struct UseDispatch<State: ReduxState, T: FeatureActions>: DynamicProperty {
    @EnvironmentObject var store: Store<State>
    
    public var wrappedValue: (T) -> Void {
        { creator in
            store.dispatch(action: creator.action())
        }
    }
    
    public init(_ stateType: State.Type, _ creatorType: T.Type) {}
    
}
