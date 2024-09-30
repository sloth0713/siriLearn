//
//  ShareTimerLiveActivity.swift.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI
import Combine
import ActivityKit
import WidgetKit

@available(iOS 18.0, *)
@Observable
final class ShareTimerLiveActivity: ObservableObject, Codable, Equatable, Hashable, Identifiable {
    static func == (lhs: ShareTimerLiveActivity, rhs: ShareTimerLiveActivity) -> Bool {
        lhs.id == rhs._id
    }
    
    static let shared: ShareTimerLiveActivity = ShareTimerLiveActivity()
    
    var id: UUID = UUID()
    var isRunning: Bool = false
    var duration: Int = 0
    var currentTime: Int = 0
    
    var isLiveACtivityTimerOn: Bool = false
    

    
    init() {
    }
    
    func startTimer() {
        
//        timerObject.sink { _ in
//
//        }
//        self.activeTimer = timerObject.autoconnect()
        guard !self.isRunning else {
            print("fdsaf")
            return
        }
        self.startActivity()
        
//        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(self.duration)) {
//            guard self.isRunning else { return }
//            
////            withAnimation(.spring) {
////                self.isRunning = false
//                self.isLiveACtivityTimerOn = false
//                ControlCenter.shared.reloadAllControls()
//            self.endActivity()
////            }
//        }
        
        
        self.isRunning = true
        ShareManager.shared.isLiveActivityTimerOn = true
        Timer.scheduledTimer(withTimeInterval: TimeInterval(self.duration), repeats: false) { timer in
//            guard self.isRunning else { return }
            
//            withAnimation(.spring) {
//                self.isRunning = false
            self.isRunning = false
            ShareManager.shared.isLiveActivityTimerOn = false
            ControlCenter.shared.reloadAllControls()
            print("ControlCenter.shared.reloadAllControls()")
            self.endActivity()
        }
    }
    
    func stopTimer() {
        guard isRunning else { return }
        self.isRunning = false
        
        #if canImport(ActivityKit)
        self.endActivity()
        #endif
        
        withAnimation(.easeOut) {
            self.currentTime = 0
        }
//        timer.upstream.connect().cancel()
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(self.id)
    }
}

@available(iOS 18.0, *)
extension ShareTimerLiveActivity {
    func startActivity() {
        
        let contentState = TimerAttributes.ContentState(loading: self)
        
        do {
            _ = try Activity.request(attributes: TimerAttributes(), content: ActivityContent(state: contentState, staleDate: .distantFuture, relevanceScore: 10))
            
//            DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
//                self.pingActivity()
//            }
        } catch {
            print(error)
        }
    }
    
    func pingActivity() {
        guard let currentTimer = Activity<TimerAttributes>.activities.first else { return }
        
        let contentState = TimerAttributes.ContentState(loading: self)
        let content = ActivityContent(state: contentState, staleDate: .distantFuture, relevanceScore: 10)
        
        Task {
            await currentTimer.update(content, alertConfiguration: .init(title: "TMC Timer", body: "Timer has ended", sound: .default))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now()+1.0) {
            self.pingActivity()
        }
    }
    
    func endActivity() {
        if let currentTimer = Activity<TimerAttributes>.activities.first {
            Task { await currentTimer.end(nil, dismissalPolicy: .immediate) }
        }
    }
}
