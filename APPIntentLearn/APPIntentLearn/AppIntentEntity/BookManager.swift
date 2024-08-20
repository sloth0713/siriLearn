//
//  BookManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//

class BookManager{
    static let share = BookManager()
    
    var Books:[BookModel] = [
        BookModel(name: "name1", author: "author1"),
        BookModel(name: "name2", author: "author2"),
        BookModel(name: "name3", author: "author3"),
    ]
    
    func findBookWithName(name:String) -> BookModel{
        var findModel : BookModel = BookModel(name: "unknown", author: "unknown")
        for model:BookModel in BookManager.share.Books{
            if (model.name == name){
                findModel = model
            }
        }
        return findModel
    }
    
}
