//  Copyright © 2023 All Rights Reserved.

import Features
import SwiftUI
import Redux

public struct TabRoot: View {
    
    @SelectState(\AppState.navigationState) private var navigationState
    @UseDispatch(AppState.self, NavigationActions.self) private var navigationDispatch
    
    public var body: some View {
        TabView(
            selection: .init(
                get: { navigationState.selectTab },
                set: { navigationDispatch(.selectTab($0)) }
            )
        ) {
            OverviewTab {
                OverviewScreen()
            }
            .tabItem {
                Label(
                    "概要",
                    systemImage: "suit.heart.fill"
                )
            }
            .tag(Tabs.overview)
            ShareTab {
                ShareScreen()
            }
            .tabItem {
                Label(
                    "共有",
                    systemImage: "person.2.fill"
                )
            }
            .tag(Tabs.share)
            BrowseTab {
                BrowseScreen()
                
            }
            .tabItem {
                Label(
                    "ブラウズ",
                    systemImage: "square.grid.2x2.fill"
                )
            }
            .tag(Tabs.browse)
        }
    }
    
    public init() {}

}
