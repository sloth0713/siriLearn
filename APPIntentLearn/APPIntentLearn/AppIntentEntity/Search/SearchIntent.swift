//
//  SearchIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/10/11.
//
import AppIntents
struct SearchIntent: AppIntent{
    static var title: LocalizedStringResource = LocalizedStringResource("search with app")
    
    static var openAppWhenRun = true
    
    @Parameter(title: "search Type")
    var searchType: SearchEnum
    
    func perform() async throws -> some IntentResult & ProvidesDialog{
        return .result(dialog: IntentDialog(stringLiteral: "你搜索了 \(self.searchType)"))
    }
    
}

struct SearchOptionsProvider: DynamicOptionsProvider {
 func results() async throws -> [SearchEnum] {
     return [.Art, .Education, .Science]
 }
}
