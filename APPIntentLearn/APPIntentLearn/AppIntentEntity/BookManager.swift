//
//  BookManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//

import Foundation

//xiyouji,hongloumeng,sanguoyanyi,shuihuzhuan

class BookManager{
    static let share = BookManager()
    
    var Books:[BookModel] = []
    
    init() {
//        for i in 1...3{
//            self.Books.append(BookModel(name: "name \(i)", author: "author \(i)"))
//        }
        self.Books.append(BookModel(name: "xiyouji", author: "author_xiyouji",imageName: "xiyouji"))
        self.Books.append(BookModel(name: "hongloumeng", author: "author_hongloumeng",imageName: "hongloumeng"))
        self.Books.append(BookModel(name: "sanguoyanyi", author: "author_sanguoyanyi",imageName: "sanguoyanyi"))
        self.Books.append(BookModel(name: "shuihuzhuan", author: "author_shuihuzhuan",imageName: "shuihuzhuan"))
        
    }
    
    func findBookWithId(id:UUID) -> BookModel{
        var findModel : BookModel = BookModel(name: "unknown", author: "unknown", imageName: "unknown")
        for model:BookModel in BookManager.share.Books{
            if (model.id == id){
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
