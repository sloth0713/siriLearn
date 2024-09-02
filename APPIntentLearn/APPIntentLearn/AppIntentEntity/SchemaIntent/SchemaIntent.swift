//
//  SchemaIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//
import AppIntents

@AssistantIntent(schema: .photos.openAsset)
struct SchemaOpenAssetIntent: OpenIntent {
    
    //用户选择后自动赋值
    var target: schemaPhotoEntity

    @MainActor
    func perform() async throws -> some IntentResult {
        print("name : \(target.asset), author : \(target.asset)")
        return .result()
    }
}

