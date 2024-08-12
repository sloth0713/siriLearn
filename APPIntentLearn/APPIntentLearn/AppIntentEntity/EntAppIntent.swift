//
//  EntAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//
import AppIntents

struct EntAppIntentShortcuts: AppShortcutsProvider {
    static var appShortcuts : [AppShortcut] {
        AppShortcut(
            intent: EntAppIntent(),
            phrases: [
                "Ent App Intent \(.applicationName)"
            ],
            shortTitle:  "Ent App Intent",//
            systemImageName: "sunset"
        )
    }
}

struct EntAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Ent App Intent" }

    @Parameter(title: "Photo Name")
    var Photo: PhotoEntity

    func perform() async throws -> some IntentResult {
        print("fdsaf")
        print(Photo.model.name)
        return .result()
    }
}
