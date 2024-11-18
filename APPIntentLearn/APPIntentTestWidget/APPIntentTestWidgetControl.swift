//
//  APPIntentTestWidgetControl.swift
//  APPIntentTestWidget
//
//  Created by ByteDance on 2024/8/7.
//

import AppIntents
import SwiftUI
import WidgetKit
@available(iOS 18.0, *)
struct APPIntentTestWidgetControl: ControlWidget {
    static let kind: String = "yjx-xcdebug.APPIntentLearn.APPIntentTestWidget"

    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: Self.kind,
            provider: Provider()
        ) { value in
            ControlWidgetToggle(
                "Start Timer",
                isOn: value.isRunning,
                action: StartTimerIntent(value.name),
                valueLabel: { isRunning in
                    Label(isRunning ? "On" : "Off", systemImage: "timer")
                }
            )
        }
        .displayName("Timer")
        .description("A an example control that runs a timer.")
    }
}
@available(iOS 18.0, *)
extension APPIntentTestWidgetControl {
    struct Value {
        var isRunning: Bool
        var name: String
    }

    struct Provider: AppIntentControlValueProvider {
        func previewValue(configuration: TimerConfiguration) -> Value {
            APPIntentTestWidgetControl.Value(isRunning: false, name: configuration.timerName)
        }

        func currentValue(configuration: TimerConfiguration) async throws -> Value {
            let isRunning = true // Check if the timer is running
            return APPIntentTestWidgetControl.Value(isRunning: isRunning, name: configuration.timerName)
        }
    }
}
@available(iOS 18.0, *)
struct TimerConfiguration: ControlConfigurationIntent {
    static var title: LocalizedStringResource { "Timer Name Configuration" }

    @Parameter(title: "Timer Name", default: "aa")
    var timerName: String
}
@available(iOS 18.0, *)
struct StartTimerIntent: SetValueIntent {
    static var title: LocalizedStringResource { "Start a timer" }

    @Parameter(title: "Timer Name")
    var name: String

    @Parameter(title: "Timer is running")
    var value: Bool

    init() {}

    init(_ name: String) {
        self.name = name
    }

    func perform() async throws -> some IntentResult {
        // Start the timer…
        return .result()
    }
}
