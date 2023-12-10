//  Copyright © 2023 All Rights Reserved.

import SwiftUI

public struct OverviewTab<Content: View>: View {
    
    private let content: Content
    
    public var body: some View {
        content
        // TODO: Navigationの実装を追加する
    }
    
    public init(
        @ViewBuilder content: () -> Content) {
        self.content = content()
    }
}

#Preview {
    OverviewTab {
        
    }
}
