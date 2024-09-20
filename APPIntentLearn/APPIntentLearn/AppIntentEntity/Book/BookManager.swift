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
    var imageLoaclUrl:[URL] = []
    
    init() {
//        self.Books.append(BookModel(name: "xiyouji", author: "author_xiyouji",imageName: "xiyouji"))
//        self.Books.append(BookModel(name: "hongloumeng", author: "author_hongloumeng",imageName: "hongloumeng"))
//        self.Books.append(BookModel(name: "sanguoyanyi", author: "author_sanguoyanyi",imageName: "sanguoyanyi"))
//        self.Books.append(BookModel(name: "shuihuzhuan", author: "author_shuihuzhuan",imageName: "shuihuzhuan"))
        if (!ABManager.share.useOnlineIntentIcon){
            let nameArray:[String] = ["xiyouji","hongloumeng","sanguoyanyi","shuihuzhuan"]
            for bookName in nameArray{
                self.Books.append(BookModel(name: bookName, author: "author_\(bookName)",imageName: bookName,imageUrl:URL(filePath: "fdas")!,type: .EntityTypeBusiness))
            }
        }else{
            self.Books = []
        }
        
        self.Books.append(BookModel(name: "open book", author: "book",imageName: "book",imageUrl:URL(filePath: "fdas")!,type: .EntityTypeGeneral))
        self.imageLoaclUrl = []
    }
    
    func appendImageUrl(bookName:String,imageUrl:URL) ->Void{
        self.Books.append(BookModel(name: bookName, author: "author_\(bookName)",imageName: bookName,imageUrl: imageUrl,type: .EntityTypeBusiness))
        self.imageLoaclUrl.append(imageUrl)
    }
    
    func findBookWithId(id:UUID) -> BookModel{
        var findModel : BookModel = BookModel(name: "unknown", author: "unknown", imageName: "unknown",imageUrl:URL(filePath: "fdas")!,type: .EntityTypeBusiness)
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
