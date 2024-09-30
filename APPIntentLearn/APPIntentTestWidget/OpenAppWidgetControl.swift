//
//  OpenAppWidgetControl.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import AppIntents
import SwiftUI
import WidgetKit

@available(iOS 18.0, *)
struct OpenAppWidgetControl: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.APPIntentTestWidget_OpenAPP"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton( action: OpenAPPIntent()){
                Image(systemName: "play")
                Text("open app page")
            }
        }
        .displayName("open app page Control")
    }
}

@available(iOS 18.0, *)
struct OpenAPPIntent: AppIntent {
    static var title: LocalizedStringResource = "title_Yjx_ButtonWidgetOpenAPPIntent"
    static var description = IntentDescription("description_Yjx_ButtonWidgetOpenAPPIntent")

    static let openAppWhenRun: Bool = true//这里需要把主target作为membership
    
    @MainActor
    func perform() async throws -> some IntentResult {
        return .result()//不能加UI
    }
}
