//  Copyright © 2023 All Rights Reserved.

import Foundation

public protocol Action: Sendable { }

public protocol PayloadAction: Action {
    associatedtype Payload: Sendable
    var payload: Payload { get }
    init(_ payload: Payload)
}

public extension PayloadAction where Payload == Void {
    var payload: Payload { () }
    init() {
        self.init(())
    }
}
