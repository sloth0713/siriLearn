//
//  BookEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents
import Foundation

struct BookEntity: AppEntity, Identifiable {//单个选项
    
    
    var model: BookModel
    var id: UUID
    
    static var defaultQuery = selectBookQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Book Asset"
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(model.name)",
                              subtitle: "\(model.author)",
                              image: DisplayRepresentation.Image(named: model.imageName))
    }
}

struct selectBookQuery: EntityQuery {
    
        /*
         EntityStringQuery协议在手动配置appintent，选择参数时支持搜索，基本没啥用
            如果不实现此方法，配置时会展示所有suggestedEntities
         */
    
//    func entities(matching string: String) async throws -> [BookEntity] {
//        
//        let bookModels:[BookModel] = BookManager.share.matchBookWithName(name: string)
//        var Books: [BookEntity] = []
//        for bookModel in bookModels {
//            Books.append(BookEntity(model:bookModel))
//        }
//        return Books
//    }
    
    
    func entities(for identifiers: [UUID]) async throws -> [BookEntity] {
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


extension selectBookQuery: EntityStringQuery {
    
    func entities(matching string: String) async throws -> [BookEntity] {

        let bookModels:[BookModel] = BookManager.share.matchBookWithName(name: string)
        var Books: [BookEntity] = []
        for bookModel in bookModels {
            Books.append(BookEntity(model:bookModel,id: bookModel.id))
        }
        return Books
    }
}

struct BookModel : Identifiable, Hashable, Sendable {
    var id: UUID
    
    var name: String
    var author: String
    var imageName: String
    
    init(name: String, author: String,imageName:String) {
        self.id = UUID()
        self.name = name
        self.author = author
        self.imageName = imageName
    }
}
