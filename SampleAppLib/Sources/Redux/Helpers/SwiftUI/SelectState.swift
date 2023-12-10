//  Copyright © 2023 All Rights Reserved.

import Foundation
import SwiftUI

@propertyWrapper
public struct SelectState<State: ReduxState, T: Sendable>: DynamicProperty {
    @EnvironmentObject var store: Store<State>
    private let key: KeyPath<State, T>
    
    public var wrappedValue: T {
        store.state[keyPath: key]
    }
    
    public init(_ key: KeyPath<State, T>) {
        self.key = key
    }
}
