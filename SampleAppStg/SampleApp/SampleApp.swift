//  Copyright © 2023 All Rights Reserved.

import SwiftUI
import AppMain

@main
struct SampleAppStgApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            Root()
        }
    }
}
