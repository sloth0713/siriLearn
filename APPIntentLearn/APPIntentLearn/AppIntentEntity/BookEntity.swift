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
            books.append(BookEntity(model:bookModel.init(name: bookName)))
        }
        //用户选中的字符串，组装成entities，返回给intent
        return books
    }
    
    func suggestedEntities() async throws -> [BookEntity] {
        [
            BookEntity(model: bookModel.init(name: "book1", author: "author1")),
            BookEntity(model: bookModel.init(name: "book2", author: "author2")),
            BookEntity(model: bookModel.init(name: "book3", author: "author3")),
        ]
    }
}

class bookModel {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
                
    init(name: String) {
        self.name = name
        self.author = "author_\(self.name)"
    }
}
