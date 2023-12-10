//  Copyright © 2023 All Rights Reserved.

import SwiftUI
import AppMain

@main
struct SampleApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    let appRoot = SampleAppRoot()
    
    var body: some Scene {
        WindowGroup {
            appRoot.build
        }
    }
}
