//
//  PhotoManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/12.
//

class PhotoManager{
    static let share = PhotoManager()
    
    var photos:[photoModel] = [
        photoModel(name: "name1", author: "author1"),
        photoModel(name: "name2", author: "author2"),
        photoModel(name: "name3", author: "author3"),
    ]
    
    func findPhotoWithName(name:String) -> photoModel{
        var findModel : photoModel = photoModel(name: "unknown", author: "unknown")
        for model:photoModel in PhotoManager.share.photos{
            if (model.name == name){
                findModel = model
            }
        }
        return findModel
    }
    
}
