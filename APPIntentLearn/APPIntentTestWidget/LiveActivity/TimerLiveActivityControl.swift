//
//  TimerLiveActivityControl.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

//LiveACtivity

import AppIntents
import SwiftUI
import WidgetKit

@available(iOS 18.0, *)
struct TimerLiveActivityControl: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.APPIntentTestWidget.TimerLiveActivityControl"

    var body: some ControlWidgetConfiguration {
        StaticControlConfiguration(kind: Self.kind) {
            ControlWidgetToggle(isOn: ShareManager.shared.isLiveActivityTimerOn, action: LiveActivityTimerIntent()) { isTurnedOn in
                Image(systemName: isTurnedOn ? "pencil.circle":"fan")
                Text(isTurnedOn ? "Turned On" : "Turned Off")
            } label: {
                Text("Live Activity Timer")
            }.tint(.purple)
        }
        .displayName("Live Activity Control")
        
    }
}

@available(iOS 18.0, *)
struct LiveActivityTimerIntent: SetValueIntent, LiveActivityIntent {
    static var title: LocalizedStringResource { "Live Activity timer" }
    
    @Parameter(title: "is Turned On")
    var value: Bool
    
    @MainActor
    func perform() async throws -> some IntentResult {
        ShareTimerLiveActivity.shared.duration = 6
        ShareTimerLiveActivity.shared.startTimer()
        
        return .result()
    }
}
