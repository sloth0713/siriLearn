//
//  MyShortcutsProvider.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//
import AppIntents

@available(iOS 17.2, *)
class EntAppIntentShortcuts: AppShortcutsProvider {
    static var appShortcuts : [AppShortcut] {

//        AppShortcut(intent: PlayVideoIntentImpl(),
//                    phrases: [
//                        "PlayVideoIntentImpl with \(.applicationName)",
//                             ],
//                    shortTitle: "PlayVideoIntentImpl",
//                    systemImageName: "play")
//        
//        //suggestion那边永远展示注册的第一个的intent结果
//        AppShortcut(intent: SingleIntent2(),
//                    phrases: [
//                        "SingleIntent2 with \(.applicationName)",
//                             ],
//                    shortTitle: "Single Intent2",
//                    systemImageName: "heart")

//        AppShortcut(intent: SingleIntent(),
//                    phrases: [
//                        "SingleIntent with \(.applicationName)",
//                             ],
//                    shortTitle: "Single Intent1",
//                    systemImageName: "heart")
        
        AppShortcut(intent: GYLIntent(),
                    phrases: [
                        "\(.applicationName) \(\.$Entity) with ",
                             ],
                    shortTitle: "Guess you",
                    systemImageName: "heart",
                    parameterPresentation: ParameterPresentation(
                        for: \.$Entity,
                        summary: Summary("\(\.$Entity)"),
                        optionsCollections: {
                            OptionsCollection(SelectGYLQuery(), title: "Guess you", systemImageName: "heart")
                        }
                    ))
        
//        AppShortcut(intent: SearchIntent(),
//                    phrases: [
//                        "\(.applicationName) Search \(\.$searchType) with ",
////                        "Search with \(.applicationName)"
//                        //有searchType作为变量就展示所有type，否则展示整体intent
//                             ],
//                    shortTitle: "Search Intent",
//                    systemImageName: "magnifyingglass",
//                    parameterPresentation: ParameterPresentation(
//                        for: \.$searchType,
//                        summary: Summary("\(\.$searchType)"),
//                        optionsCollections: {
//                            OptionsCollection(SearchOptionsProvider(), title: "Education", systemImageName: "magnifyingglass")
//                        }
//                    ))

        
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
        
//        AppShortcut(
//            intent: BookAppIntent(),
//            phrases: [
//                "\(.applicationName) Get \(\.$Book) with ",//phrases里必须有这个entity才能有单独的collection
////                "Get with \(.applicationName)"//如果有这条无参数的phase，Shortcut也会展示在spotlight中
//            ],
//            shortTitle:  "Book App Intent",//
//            systemImageName: "book",
//            parameterPresentation: ParameterPresentation(
//                for: \.$Book,
//                summary: Summary("Get \(\.$Book)"),
//                optionsCollections: {
//                    OptionsCollection(selectBookQuery2(), title: "Favorite books", systemImageName: "book")//这里selectBookQuery2()好像永远都不会被调用
//                }
//            )
//        )
        
//        AppShortcut(
//            intent: InboxAppIntent(),
//            phrases: [
//                "Get \(\.$inboxEntity) with \(.applicationName)"//\(\.$inboxEntity)
//                /*解析出来的是AppEntity的 displayRepresentation的title
//                对象中的phase是[("Get ${Book} with ${applicationName}", Set(["Book"]))]，需要使用翻译能力AppShortcuts.strings
//                https://sowenjub.me/writes/localizing-app-shortcuts-with-app-intents/
//                 */
//            ],
////
//            shortTitle:  "Inbox App Intent",//
//            systemImageName: "book",
//            parameterPresentation: ParameterPresentation(
//                for: \.$inboxEntity,
//                summary: Summary("Get111 \(\.$inboxEntity)"),
//                optionsCollections: {
//                    OptionsCollection(selectInboxQuery(), title: "Favorite friends", systemImageName: "bag.fill")
//                }
//            )
//        )
    }
}
