//
//  EntAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//
import AppIntents
import SwiftUI

struct BookAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Book App Intent" }

    //用户选择后自动赋值
    @Parameter(title: "Book Name")
    var Book: BookEntity

    func perform() async throws -> some IntentResult & ReturnsValue<BookEntity> & ProvidesDialog & OpensIntent & ShowsSnippetView{
        print("name : \(Book.model.name), author : \(Book.model.author)")
        
        return .result(
            value: Book,//ReturnsValue<BookEntity>
            opensIntent: BuyBookIntent(paramsBook: $Book),//OpensIntent
            dialog: IntentDialog("")
        )
    }
}

struct BuyBookIntent: AppIntent {
    
//    intent连接的intent,需要两个intent都配置ProvidesDialog & ShowsSnippetView，内容是第二个intent的
    @Parameter(title: "paramsBook")
    var paramsBook: BookEntity
    
    static var title: LocalizedStringResource { "Next Book App Intent" }

    @MainActor
    func perform() async throws -> some IntentResult & ProvidesDialog & ShowsSnippetView{
        print("Next Book App Intent!")
        
        return .result(
            dialog: IntentDialog("selected book :\(paramsBook.model.name) ,author\(paramsBook.model.author)")
        )
        {
            ShortcutInsightsView(model: paramsBook.model)
        }
    }
}

struct ShortcutInsightsView: View {

    let model: BookModel
    
    var body: some View {
        VStack(spacing: 2) {
            Text("This is your asset \(model.name)")
                .font(.system(size: 17, weight: .medium, design: .rounded))
            if (model.type == .EntityTypeBusiness){
                Image(uiImage: UIImage(named: model.imageName)!)
            }else{
                Image(uiImage: UIImage(systemName: model.imageName)!)
            }
        }
        .padding(20)
    }
}
