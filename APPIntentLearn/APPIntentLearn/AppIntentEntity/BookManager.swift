//
//  BookManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//

class BookManager{
    static let share = BookManager()
    
    var books:[bookModel] = [
        bookModel(name: "name1", author: "author1"),
        bookModel(name: "name2", author: "author2"),
        bookModel(name: "name3", author: "author3"),
    ]
    
    func findBookWithName(name:String) -> bookModel{
        var findModel : bookModel = bookModel(name: "unknown", author: "unknown")
        for model:bookModel in BookManager.share.books{
            if (model.name == name){
                findModel = model
            }
        }
        return findModel
    }
    
}
