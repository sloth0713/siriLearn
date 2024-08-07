//
//  StaticWidgetControl.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import AppIntents
import SwiftUI
import WidgetKit

struct StaticWidgetControlToogle: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.StaticToggleWidgetControl"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetToggle(isOn: ShareManager.shared.isTurnedOn, action: SimpleTimerIntent()) { isTurnedOn in
                Image(systemName: ShareManager.shared.isTurnedOn ? "fan.fill" : "fan")
                Text(ShareManager.shared.isTurnedOn ? "Turned On" : "Turned Off")
            } label: {
                Text("fan")
            }
        }
        .displayName("Toggle Control")
    }
}

struct StaticWidgetControlButton: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.StaticButtonWidgetControl"//不能重复，不然会有问题

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetButton( action: ButtonWidgetControlOpenAPPIntent()){
                Image(systemName: "play.rectangle.fill")
                Text("open app page")
            }
        }
        .displayName("Button Control")
    }
    
}


struct ButtonWidgetControlOpenAPPIntent: AppIntent {
    static var title: LocalizedStringResource = "title_Yjx_ButtonWidgetControlOpenAPPIntent"
    static var description = IntentDescription("description_Yjx_ButtonWidgetControlOpenAPPIntent")

//    static let openAppWhenRun: Bool = true//这里需要把主target作为membership
    
    @MainActor
    func perform() async throws -> some IntentResult {
        print("fasdfdsa");
//        return .result(dialog: IntentDialog(stringLiteral: "fffff"))
        return .result()//不能加UI
    }
}



struct SimpleTimerIntent: SetValueIntent {
    static var title: LocalizedStringResource { "Simple timer" }
    
    @Parameter(title: "is Turned On")
    var value: Bool

    func perform() async throws -> some IntentResult {
        // Start the timer…
//        ShareManager.shared.startTime()
        ShareManager.shared.isTurnedOn = value
        return .result()
    }
}
