//
//  LiveActivitiyIntents.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import AppIntents

struct StopTimerIntent: LiveActivityIntent {
    static var title: LocalizedStringResource = "Stop the timer"
    static var description = IntentDescription("Stop any currently active test timer")
    
    func perform() async throws -> some IntentResult {
        ShareTimerLiveActivity.shared.stopTimer()
        ShareTimerLiveActivity.shared.endActivity()
        
        return .result()
    }
}


