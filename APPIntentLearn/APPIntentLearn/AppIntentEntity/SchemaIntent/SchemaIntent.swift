//
//  SchemaIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//
import AppIntents
import SwiftUI

@available(iOS 18.0, *)
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
            SchemaShortcutInsightsView(model: target.model)
        }
    }
}
struct SchemaShortcutInsightsView: View {

    let model: schemaPhotoModel
    
    var body: some View {
        VStack(spacing: 2) {
            Text("This is your asset \(model.name)")
            Image(uiImage: UIImage(named: model.asset)!)
        }
        .padding(20)
    }
}

