//
//  EntAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//
import AppIntents

struct BookAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Ent App Intent" }

    //用户选择后自动赋值
    @Parameter(title: "Book Name")
    var Book: BookEntity

    func perform() async throws -> some IntentResult {
        print("name : \(Book.model.name), author : \(Book.model.author)")
        return .result()
    }
}
