//
//  TimerLiveActivity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import ActivityKit
import WidgetKit
import SwiftUI

@available(iOS 18.0, *)
struct TimerAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        var loading: ShareTimerLiveActivity
    }
    
    var start: Date = .now
}

@available(iOS 18.0, *)
struct WidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: TimerAttributes.self) { context in
            HStack {
                Text("Timer")
                    .font(.headline)
                
                Button(intent: StopTimerIntent()) {
                    Image(systemName: "xmark")
                }
                
                Spacer()
                specialGauge(context: context)
            }
            .padding()
            .activityBackgroundTint(Color.black)
            .activitySystemActionForegroundColor(Color.white)
        } dynamicIsland: { context in
            DynamicIsland {
                // this doesnt work BEFORE the timer ends
                DynamicIslandExpandedRegion(.leading) {
                    Text("Timer")
                        .font(.headline)
                        .padding()
                }
                
                DynamicIslandExpandedRegion(.trailing) {
                    specialGauge(context: context)
                }
            } compactLeading: {
                Image(systemName: "fan")
                    .foregroundStyle(Color.orange)
            } compactTrailing: {
                countdown(context: context)
                    .frame(alignment: .trailing)
            } minimal: {
                countdown(context: context, color: Color.orange)
            }
            .keylineTint(Color.orange)
        }
    }
    
    @ViewBuilder
    func specialGauge(context: ActivityViewContext<TimerAttributes>) -> some View {
        Gauge(value: Double(context.state.loading.currentTime), in: 0.0...Double(context.state.loading.duration)) {
            Image(systemName: "timer")
                .foregroundStyle(Color.orange)
        } currentValueLabel: {
            countdown(context: context)
        }
        .gaugeStyle(.accessoryCircularCapacity)
        .tint(Color.orange)
    }
    
    @ViewBuilder
    func countdown(context: ActivityViewContext<TimerAttributes>, color: Color = Color.white) -> some View {
        let textTime = context.attributes.start + TimeInterval(context.state.loading.currentTime)
        Text(textTime, style: .timer)
            .foregroundColor(color)
            .contentTransition(.numericText(countsDown: true))
            .frame(maxWidth: 50, alignment: .trailing)
    }
}



//#Preview("Notification", as: .content, using: WidgetAttributes.preview) {
//   WidgetLiveActivity()
//} contentStates: {
//    WidgetAttributes.ContentState.smiley
//    WidgetAttributes.ContentState.starEyes
//}

