//
//  MyShortcutsProvider.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//
import AppIntents

class EntAppIntentShortcuts: AppShortcutsProvider {
    static var appShortcuts : [AppShortcut] {

        AppShortcut(intent: GYLIntent(),
                    phrases: [
                        "\(\.$Entity) with \(.applicationName)",
                             ],
                    shortTitle: "Guess you like",
                    systemImageName: "heart",
                    parameterPresentation: ParameterPresentation(
                        for: \.$Entity,
                        summary: Summary("Get \(\.$Entity)"),
                        optionsCollections: {
                            OptionsCollection(SelectGYLQuery(), title: "Guess you like", systemImageName: "heart")
                        }
                    ))
        
        AppShortcut(intent: SearchIntent(),
                    phrases: [
                        "Search \(\.$searchType) with \(.applicationName)",
//                        "Search with \(.applicationName)"
                        //有searchType作为变量就展示所有type，否则展示整体intent
                             ],
                    shortTitle: "Search Intent",
                    systemImageName: "magnifyingglass",
                    parameterPresentation: ParameterPresentation(
                        for: \.$searchType,
                        summary: Summary("Get \(\.$searchType)"),
                        optionsCollections: {
                            OptionsCollection(SearchOptionsProvider(), title: "Guess you like", systemImageName: "magnifyingglass")
                        }
                    ))

        
//        AppShortcut(intent: SchemaOpenAssetIntent(),
//                    phrases: ["Schema Open Asset Intent \(.applicationName)"],
//                    shortTitle: "Schema Open Asset Intent",
//                    systemImageName: "photo")
  
        //普通Shortcut
//        AppShortcut(
//            intent: BookAppIntent(),
//            phrases: [
//                //Get hongloumeng with APPIntentLearn
//                "Get \(\.$Book) with \(.applicationName)",
////                "Get with \(.applicationName)"
//            ],
//            shortTitle:  "shortTitle",
//            systemImageName: "book")
//        
        //带多个intent的Shortcut
        
        AppShortcut(
            intent: BookAppIntent(),
            phrases: [
                "Get \(\.$Book) with \(.applicationName)",//phrases里必须有这个entity才能有单独的collection
//                "Get with \(.applicationName)"//如果有这条无参数的phase，Shortcut也会展示在spotlight中
            ],
            shortTitle:  "Book App Intent",//
            systemImageName: "book",
            parameterPresentation: ParameterPresentation(
                for: \.$Book,
                summary: Summary("Get \(\.$Book)"),
                optionsCollections: {
                    OptionsCollection(selectBookQuery(), title: "Favorite books", systemImageName: "book")
                }
            )
        )
        
        AppShortcut(
            intent: InboxAppIntent(),
            phrases: [
                "Get \(\.$inboxEntity) with \(.applicationName)"//\(\.$inboxEntity)
                /*解析出来的是AppEntity的 displayRepresentation的title
                对象中的phase是[("Get ${Book} with ${applicationName}", Set(["Book"]))]，需要使用翻译能力AppShortcuts.strings
                https://sowenjub.me/writes/localizing-app-shortcuts-with-app-intents/
                 */
            ],
//
            shortTitle:  "Inbox App Intent",//
            systemImageName: "book",
            parameterPresentation: ParameterPresentation(
                for: \.$inboxEntity,
                summary: Summary("Get111 \(\.$inboxEntity)"),
                optionsCollections: {
                    OptionsCollection(selectInboxQuery(), title: "Favorite friends", systemImageName: "bag.fill")
                }
            )
        )
    }
}
