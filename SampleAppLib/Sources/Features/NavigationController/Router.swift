//  Copyright © 2023 All Rights Reserved.

import SwiftUI

public protocol Router {
    associatedtype RouteType: Route
    associatedtype Content: View
    @MainActor
    @ViewBuilder
    func routing(_ route: RouteType) -> Content
}
