//
//  StaticWidgetControl.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import AppIntents
import SwiftUI
import WidgetKit
@available(iOS 18.0, *)
struct StaticWidgetControlToogle: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.APPIntentTestWidget_SimpleTimer"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            
            ControlWidgetToggle(isOn: ShareManager.shared.isTimerOn, action: SimpleTimerIntent()) {
                Image(systemName: ShareManager.shared.isTimerOn ? "fan.fill" : "fan")
                Text(ShareManager.shared.isTimerOn ? "Turned On" : "Turned Off")
            }
        }
        .displayName("Toggle Control")
    }
}
@available(iOS 18.0, *)
struct StaticWidgetControlButton: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.APPIntentTestWidget_ButtonWidget"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton( action: ButtonWidgetControlIntent()){
                Image(systemName: "play.rectangle.fill")
                Text("Button Control")
            }
        }
        .displayName("Button Control")
    }
    
}

@available(iOS 18.0, *)
struct ButtonWidgetControlIntent: AppIntent {
    static var title: LocalizedStringResource = "title_Yjx_ButtonWidgetControlIntent"
    static var description = IntentDescription("description_Yjx_ButtonWidgetControlIntent")
    
    @MainActor
    func perform() async throws -> some IntentResult {
        print("fasdfdsa");
        return .result()//不能加UI
    }
}


@available(iOS 18.0, *)
struct SimpleTimerIntent: SetValueIntent {
    static var title: LocalizedStringResource { "Simple timer" }
    
    @Parameter(title: "is Turned On")
    var value: Bool
    @MainActor
    func perform() async throws -> some IntentResult {
        ShareManager.shared.startTime()
        return .result()
    }
}
