//
//  EntAppIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//
import AppIntents
import SwiftUI

struct SingleIntent2: AppIntent  {
    
    static var title: LocalizedStringResource { "SingleIntent2" }
    static var persistentIdentifier: String = "SingleIntent2"
    static var description: IntentDescription? = IntentDescription(stringLiteral: "SingleIntent2 description")
    static var openAppWhenRun = true
//    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed
    func perform() async throws -> some IntentResult & ProvidesDialog{
        print("SingleIntent2 \(SingleIntent2.authenticationPolicy)")
        return .result(
            dialog: IntentDialog("")
        )
    }
}

struct SingleIntent: AppIntent , PredictableIntent {
    
    static var title: LocalizedStringResource { "SingleIntent" }
    static var persistentIdentifier: String = "SingleIntent"
    static var description: IntentDescription? = IntentDescription(stringLiteral: "SingleIntent description")
    static var openAppWhenRun = true
    static var authenticationPolicy: IntentAuthenticationPolicy = .alwaysAllowed
    
    //在创建shortcut的时候，展示详细的信息
    static var parameterSummary: some ParameterSummary {
            Summary("Get information on SingleIntent ")
    }
    static var predictionConfiguration: some IntentPredictionConfiguration {
        IntentPrediction {
            DisplayRepresentation(
                title: "SingleIntent",
                subtitle: "SingleIntent"
            )
        }
    }

    func perform() async throws -> some IntentResult {
        print("SingleIntent \(SingleIntent.authenticationPolicy)")
        return .result()
    }
}

struct BookAppIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Book App Intent" }

    static var openAppWhenRun = true
    //用户选择后自动赋值
    @Parameter(title: "Book Name", query: selectBookQuery1())
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

extension BookAppIntent{
    func performError() async throws{
        print("performError Thread \(Thread.current)")
        print("performError Thread \(Thread.isMainThread)")
        throw CustomError.someError
    }
    
    func performAsync() {
        print("performAsync Thread \(Thread.current)")
        print("performAsync Thread \(Thread.isMainThread)")
    }
}

enum CustomError: Error {
    case someError
}

struct BuyBookIntent: AppIntent {
    
//    intent连接的intent,需要两个intent都配置ProvidesDialog & ShowsSnippetView，内容是第二个intent的
    @Parameter(title: "paramsBook")
    var paramsBook: BookEntity
    
    static var isDiscoverable: Bool = false//创建快捷方式时不显示
    
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


struct selectBookQuery1: EntityQuery {
    
    func entities(for identifiers: [BookEntity.ID]) async throws -> [BookEntity] {
        var Books: [BookEntity] = []
        _ = identifiers.compactMap { BookId in
            let model:BookModel = BookManager.share.findBookWithId(id: BookId)
            Books.append(BookEntity(model:model,id: model.id))
        }
        //用户选中的字符串，在这里组装成entities，返回给intent
        return Books
    }
    
    func suggestedEntities() async throws -> [BookEntity] {
        
        var entities:[BookEntity] = []

        for model:BookModel in BookManager.share.Books{

            entities.append(BookEntity(model: model, id: model.id))
            
        }
        //展示所有的选择
        return entities
    }
}
