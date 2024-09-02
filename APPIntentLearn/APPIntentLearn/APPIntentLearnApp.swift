//
//  APPIntentLearnApp.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI

@main
struct APPIntentLearnApp: App {
    init() {

        EntAppIntentShortcuts.updateAppShortcutParameters()
    }
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
