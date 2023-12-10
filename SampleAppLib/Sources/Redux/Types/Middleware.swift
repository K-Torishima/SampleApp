//  Copyright © 2023 All Rights Reserved.

import Foundation

public typealias Middleware<StoreState: ReduxState> = @Sendable (StoreState, Action, @escaping Dispatcher) -> Void
