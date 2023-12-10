//  Copyright © 2023 All Rights Reserved.

import Foundation

public typealias Reducer<State: ReduxState> = @Sendable (_ state: State, _ action: Action) -> State
