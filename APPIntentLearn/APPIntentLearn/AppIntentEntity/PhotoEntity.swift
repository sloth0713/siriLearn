//
//  PhotoEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents

struct PhotoEntity: AppEntity, Identifiable {//单个选项
    
    
    var model: photoModel
    var id: String {
        return model.name
    }
    
    static var defaultQuery = selectPhotoQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Photo Asset"
    
    var displayRepresentation: DisplayRepresentation {
        return DisplayRepresentation(stringLiteral: model.name)
    }
}

struct selectPhotoQuery: EntityQuery {
    
    func entities(for identifiers: [String]) async throws -> [PhotoEntity] {
        var photos: [PhotoEntity] = []
        _ = identifiers.compactMap { photoName in
            var model:photoModel = PhotoManager.share.findPhotoWithName(name: photoName)
            photos.append(PhotoEntity(model:model))
        }
        //用户选中的字符串，组装成entities，返回给intent
        return photos
    }
    
    func suggestedEntities() async throws -> [PhotoEntity] {
        
        var entities:[PhotoEntity] = []
        for model:photoModel in PhotoManager.share.photos{
            entities.append(PhotoEntity(model: model))
        }
        return entities
    }
}

class photoModel {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
}
