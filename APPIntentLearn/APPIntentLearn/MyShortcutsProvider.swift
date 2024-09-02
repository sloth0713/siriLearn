//
//  MyShortcutsProvider.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//
import AppIntents

class EntAppIntentShortcuts: AppShortcutsProvider {
    static var appShortcuts : [AppShortcut] {
        
        AppShortcut(intent: SchemaOpenAssetIntent(),
                    phrases: ["Schema Open Asset Intent \(.applicationName)"],
                    shortTitle: "Schema Open Asset Intent",
                    systemImageName: "photo")
        
        AppShortcut(
            intent: BookAppIntent(),
            phrases: [
                "Get \(\.$Book) with \(.applicationName)"//phrases里必须有这个entity才能有单独的collection
//                "Get with \(.applicationName)"
            ],
            shortTitle:  "Book App Intent",//
            systemImageName: "book",
            parameterPresentation: ParameterPresentation(
                for: \.$Book,
                summary: Summary("Get \(\.$Book)"),
                optionsCollections: {
                    OptionsCollection(selectBookQuery(), title: "Favorite books", systemImageName: "book")
                }
            ))
    
    }
}
