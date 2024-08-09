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

    @Parameter(title: "Book Name")
    var Book: BookEntity

    func perform() async throws -> some IntentResult {
        print("fdsaf")
        print(Book.model.name)
        return .result()
    }
}
