//
//  GYLEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import AppIntents
import Foundation
import CoreSpotlight
import SwiftUI

struct GYLEntity: AppEntity, Identifiable{
    
    var model: GYLModel
    var id: String
    
    static var defaultQuery = SelectGYLQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = TypeDisplayRepresentation(name: LocalizedStringResource("chose you want to go"))
    
    var displayRepresentation: DisplayRepresentation {
        return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: model.name),
                                     image: DisplayRepresentation.Image(systemName: model.imageName))
    }
    
}

struct SelectGYLQuery: EntityQuery {
    
    func entities(for identifiers: [GYLEntity.ID]) async throws -> [GYLEntity] {
        var models: [GYLEntity] = []
        _ = identifiers.compactMap { GYLId in
            let model:GYLModel = GYLManager.share.findModelWithId(id: GYLId)
            models.append(GYLEntity(model:model,id: model.id))
        }
        return models
    }
    
    func suggestedEntities() async throws -> [GYLEntity] {
        
        var entities:[GYLEntity] = []

        if (ABManager.share.disableIntent) {
            return entities
        }
        
        for model:GYLModel in GYLManager.share.GYLModels{
            entities.append(GYLEntity(model: model, id: model.id))
        }
        //展示所有的选择
        return entities
    }
    
    
}
