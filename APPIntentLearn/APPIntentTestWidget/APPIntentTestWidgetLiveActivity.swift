//
//  APPIntentTestWidgetLiveActivity.swift
//  APPIntentTestWidget
//
//  Created by ByteDance on 2024/8/7.
//

import ActivityKit
import WidgetKit
import SwiftUI

struct APPIntentTestWidgetAttributes: ActivityAttributes {
    public struct ContentState: Codable, Hashable {
        // Dynamic stateful properties about your activity go here!
        var emoji: String
    }

    // Fixed non-changing properties about your activity go here!
    var name: String
}

struct APPIntentTestWidgetLiveActivity: Widget {
    var body: some WidgetConfiguration {
        ActivityConfiguration(for: APPIntentTestWidgetAttributes.self) { context in
            // Lock screen/banner UI goes here
            VStack {
                Text("Hello \(context.state.emoji)")
            }
            .activityBackgroundTint(Color.cyan)
            .activitySystemActionForegroundColor(Color.black)

        } dynamicIsland: { context in
            DynamicIsland {
                // Expanded UI goes here.  Compose the expanded UI through
                // various regions, like leading/trailing/center/bottom
                DynamicIslandExpandedRegion(.leading) {
                    Text("Leading")
                }
                DynamicIslandExpandedRegion(.trailing) {
                    Text("Trailing")
                }
                DynamicIslandExpandedRegion(.bottom) {
                    Text("Bottom \(context.state.emoji)")
                    // more content
                }
            } compactLeading: {
                Text("L")
            } compactTrailing: {
                Text("T \(context.state.emoji)")
            } minimal: {
                Text(context.state.emoji)
            }
            .widgetURL(URL(string: "http://www.apple.com"))
            .keylineTint(Color.red)
        }
    }
}

extension APPIntentTestWidgetAttributes {
    fileprivate static var preview: APPIntentTestWidgetAttributes {
        APPIntentTestWidgetAttributes(name: "World")
    }
}

extension APPIntentTestWidgetAttributes.ContentState {
    fileprivate static var smiley: APPIntentTestWidgetAttributes.ContentState {
        APPIntentTestWidgetAttributes.ContentState(emoji: "😀")
     }
     
     fileprivate static var starEyes: APPIntentTestWidgetAttributes.ContentState {
         APPIntentTestWidgetAttributes.ContentState(emoji: "🤩")
     }
}

#Preview("Notification", as: .content, using: APPIntentTestWidgetAttributes.preview) {
   APPIntentTestWidgetLiveActivity()
} contentStates: {
    APPIntentTestWidgetAttributes.ContentState.smiley
    APPIntentTestWidgetAttributes.ContentState.starEyes
}
