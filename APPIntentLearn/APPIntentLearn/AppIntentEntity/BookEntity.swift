//
//  BookEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents

struct BookEntity: AppEntity, Identifiable {//单个选项
    
    
    var model: bookModel
    var id: String {
        return model.name
    }
    
    static var defaultQuery = selectBookQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Book Asset"
    
    var displayRepresentation: DisplayRepresentation {
        return DisplayRepresentation(stringLiteral: model.name)
    }
}

struct selectBookQuery: EntityQuery {
    
    func entities(for identifiers: [String]) async throws -> [BookEntity] {
        var books: [BookEntity] = []
        _ = identifiers.compactMap { bookName in
            var model:bookModel = BookManager.share.findBookWithName(name: bookName)
            books.append(BookEntity(model:model))
        }
        //用户选中的字符串，组装成entities，返回给intent
        return books
    }
    
    func suggestedEntities() async throws -> [BookEntity] {
        
        var entities:[BookEntity] = []
        for model:bookModel in BookManager.share.books{
            entities.append(BookEntity(model: model))
        }
        return entities
    }
}

class bookModel {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
}
