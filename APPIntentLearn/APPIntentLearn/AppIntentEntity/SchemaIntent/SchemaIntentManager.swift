//
//  SchemaIntentManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//

import Foundation

class SchemaIntentManager{
    static let share = SchemaIntentManager()
    
    var SchemaPhotos:[schemaPhotoModel] = [
        schemaPhotoModel(name: "apple", author: "author_apple",asset: "apple"),
        schemaPhotoModel(name: "orange", author: "author_orange",asset: "orange"),
        schemaPhotoModel(name: "banana", author: "author_banana",asset: "banana"),
    ]
    
    func findPhotoWithName(id:UUID) -> schemaPhotoModel{
        var findModel : schemaPhotoModel = schemaPhotoModel(name: "unknown", author: "unknown",asset: "unknown")
        for model:schemaPhotoModel in SchemaIntentManager.share.SchemaPhotos{
            if (model.id == id){
                findModel = model
            }
        }
        return findModel
    }
    
}

class schemaPhotoModel{
    var name: String
    var author: String
    var asset: String
    var id:UUID
    
    init(name: String, author: String, asset: String) {
        self.id = UUID()
        self.asset = asset
        self.name = name
        self.author = author
    }
}
