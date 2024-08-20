//
//  SchemaIntentManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/20.
//

class SchemaIntentManager{
    static let share = SchemaIntentManager()
    
    var SchemaPhotos:[schemaPhotoModel] = [
        schemaPhotoModel(name: "schemaName1", author: "schemaAuthor1"),
        schemaPhotoModel(name: "schemaName2", author: "schemaAuthor2"),
        schemaPhotoModel(name: "schemaName3", author: "schemaAuthor3"),
    ]
    
    func findPhotoWithName(name:String) -> schemaPhotoModel{
        var findModel : schemaPhotoModel = schemaPhotoModel(name: "unknown", author: "unknown")
        for model:schemaPhotoModel in SchemaIntentManager.share.SchemaPhotos{
            if (model.name == name){
                findModel = model
            }
        }
        return findModel
    }
    
    func schemaPhotoNames() -> [String]{
        return ["schemaName1","schemaName2","schemaName3"]
    }
    
}
