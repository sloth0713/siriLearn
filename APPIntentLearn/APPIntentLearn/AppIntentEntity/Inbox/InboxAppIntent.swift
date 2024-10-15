//
//  InboxAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/20.
//
import AppIntents

struct InboxAppIntent:AppIntent{
    
    static var title: LocalizedStringResource{"InboxAppIntent"}
    
    static var openAppWhenRun = true
    
    //用户选择后自动赋值
    @Parameter(title: "People want to chat")
    var inboxEntity: InboxEntity?
    
    func perform() async throws -> some IntentResult {
        print("inbox with \(inboxEntity?.model.name)")
        return .result()
    }
    
    
}
