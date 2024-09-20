//
//  InboxEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/20.
//

import AppIntents

struct InboxEntity: AppEntity, IndexedEntity, Identifiable {
    
    var model: InboxModel
    var id: UUID
    
    static var defaultQuery = selectInboxQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Inbox Entity"
    
    var displayRepresentation: DisplayRepresentation {
        
        if (model.type == .EntityTypeBusiness){
            return DisplayRepresentation(title: "\(model.name)",
                                              image: DisplayRepresentation.Image(named: model.imageName))
        }else{
            return DisplayRepresentation(title: "\(model.name)",
                                         image: DisplayRepresentation.Image(systemName: model.imageName))
        }
        
    }
    
}

struct selectInboxQuery: EntityQuery {
    func entities(for identifiers: [UUID]) async throws -> [InboxEntity] {
        var inboxEntities: [InboxEntity] = []
        _ = identifiers.compactMap { ID in
            let model:InboxModel = InboxManager.share.findPeopleWithId(id: ID)
            inboxEntities.append(InboxEntity(model:model,id: model.id))
        }
        
        return inboxEntities
    }
    
    func suggestedEntities() async throws -> [InboxEntity] {
        
        var entities:[InboxEntity] = []
        
        
        for model:InboxModel in InboxManager.share.inboxModels{
            
            if (model.type == .EntityTypeBusiness){
                if (ABManager.share.enableInboxBusinessIntent){
                    entities.append(InboxEntity(model: model, id: model.id))
                }
            }
            
            if (model.type == .EntityTypeGeneral){
                if (ABManager.share.enableInboxGeneralIntent){
                    entities.append(InboxEntity(model: model, id: model.id))
                }
            }
        }
        //展示所有的选择
        return entities
    }
}
