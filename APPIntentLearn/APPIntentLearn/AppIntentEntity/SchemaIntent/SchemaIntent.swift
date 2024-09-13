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
    var target : schemaPhotoEntity

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView {
        print("name : \(target.model.name), author : \(target.model.author)")
        return .result(
            dialog: IntentDialog(stringLiteral: "name : \(target.model.name), author : \(target.model.author)")
        ){
            ShortcutInsightsView(name: target.model.name, image: target.model.asset)
        }
    }
}

