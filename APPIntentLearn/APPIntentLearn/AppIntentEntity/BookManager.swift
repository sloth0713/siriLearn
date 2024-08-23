//
//  BookManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//

class BookManager{
    static let share = BookManager()
    
    var Books:[BookModel] = []
    
    init() {
        for i in 1...20{
            self.Books.append(BookModel(name: "name \(i)", author: "author \(i)"))
        }
    }
    
    func findBookWithName(name:String) -> BookModel{
        var findModel : BookModel = BookModel(name: "unknown", author: "unknown")
        for model:BookModel in BookManager.share.Books{
            if (model.name == name){
                findModel = model
            }
        }
        return findModel
    }
    
    func matchBookWithName(name:String) -> [BookModel]{
        var findModels : [BookModel] = []
        for model:BookModel in BookManager.share.Books{
            if (model.name.contains(name)){
                findModels.append(model)
            }
        }
        return findModels
    }
    
}
