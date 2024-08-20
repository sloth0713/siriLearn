//
//  MyShortcutsProvider.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//
import AppIntents

struct EntAppIntentShortcuts: AppShortcutsProvider {
    static var appShortcuts : [AppShortcut] {
        AppShortcut(
            intent: BookAppIntent(),
            phrases: [
                "Book App Intent \(.applicationName)"
            ],
            shortTitle:  "Book App Intent",//
            systemImageName: "book"
        )
        AppShortcut(intent: SchemaOpenAssetIntent(),
                    phrases: ["Schema Open Asset Intent \(.applicationName)"],
                    shortTitle: "Schema Open Asset Intent",
                    systemImageName: "photo")
    }
}
