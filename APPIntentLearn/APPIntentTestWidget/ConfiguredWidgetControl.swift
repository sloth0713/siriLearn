//
//  ConfiguredWidgetControl.swift
//
//
//  Created by ByteDance on 2024/8/5.
//

import AppIntents
import SwiftUI
import WidgetKit

struct ConfiguredWidgetControl: ControlWidget {
    static let kind: String = "yjx-xcdebug.controlWidgetDemoForCode.ConfiguredWidgetControl"

    var body: some ControlWidgetConfiguration {
        AppIntentControlConfiguration(
            kind: Self.kind,
            provider: Provider()
        ) { value in
            ControlWidgetButton( action: openDifferentPageIntent(value.name)){
                Image(systemName: "lock.open")
                Text("open \(value.name) Page control")
            }
        }
        .displayName("open Different Page control")
        .description("A an example control that open Different Page")
        .promptsForUserConfiguration()
    }
}

extension ConfiguredWidgetControl {
    struct Value {
        var name: String
    }

    struct Provider: AppIntentControlValueProvider {
        func previewValue(configuration: UserConfiguration) -> Value {
            ConfiguredWidgetControl.Value(name: "My App")
        }

        func currentValue(configuration: UserConfiguration) async throws -> Value {
            return ConfiguredWidgetControl.Value(name: configuration.timerName)
        }
    }
}

struct UserConfiguration: ControlConfigurationIntent {
    static var title: LocalizedStringResource { "Enter Scene Name Configuration" }

    
         struct FocusOptionsProvider: DynamicOptionsProvider {
            func results() async throws -> [String] {
                 ["inbox","search","creator"]
             }
         }
    
    @Parameter(title: "Scene Name", optionsProvider: FocusOptionsProvider())
    var timerName: String
}

struct openDifferentPageIntent: AppIntent {
    static var title: LocalizedStringResource { "open Different Page" }

    @Parameter(title: "Page Name")
    var name: String

    init() {}

    init(_ name: String) {
        self.name = name
    }

    func perform() async throws -> some IntentResult {
        print("enter scene name: \(self.name)")
        return .result()
    }
}



