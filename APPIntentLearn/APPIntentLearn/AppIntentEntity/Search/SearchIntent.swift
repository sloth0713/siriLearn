//
//  SearchIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/10/11.
//
import AppIntents
struct SearchIntent: AppIntent{
    static var title: LocalizedStringResource = LocalizedStringResource("search with app")
    
    var openAppWhenRun = true
    
    @Parameter(title: "search Type")
    var searchType: SearchEnum
    
    func perform() async throws -> some IntentResult {
        return .result()
    }
    
}
