//
//  BookEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents
import Foundation
import CoreSpotlight
import SwiftUI

struct BookEntity: AppEntity, IndexedEntity, Identifiable {//单个选项
    
//    var attributeSet:CSSearchableItemAttributeSet {
//        let attributed = CSSearchableItemAttributeSet(itemContentType: "Text")
//        attributed.displayName = "jjj \(model.author)"
//        return attributed
//    }

//    var attributeSet: CSSearchableItemAttributeSet{
//        let attributes = CSSearchableItemAttributeSet()
//        attributes.displayName = "jjj \(model.author)"
//        attributes.contentDescription = "jjj contentDescription \(model.author)"
//        return attributes
//      }
    
    var model: BookModel
    var id: UUID
    
    static var defaultQuery = selectBookQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Book Asset"
    
    var displayRepresentation: DisplayRepresentation {
        
        if (ABManager.share.useOnlineIntentIcon){
            if (model.type == .EntityTypeBusiness){
                let image = UIImage(contentsOfFile: model.imageUrl.path)!
                let data:Data = image.pngData()!
                
                return DisplayRepresentation(title: "\(model.name)",
                                             subtitle: "\(model.author)",
                                             image: DisplayRepresentation.Image(data: data))//appintent
            }else{
                return DisplayRepresentation(title: "\(model.name)",
                                             image: DisplayRepresentation.Image(systemName: model.imageName))
            }
            
        }else{
            if (model.type == .EntityTypeBusiness){
                return DisplayRepresentation(title: "\(model.name)",
                                             subtitle: "\(model.author)",
                                              image: DisplayRepresentation.Image(named: model.imageName))
            }else{
                return DisplayRepresentation(title: "\(model.name)",
                                             image: DisplayRepresentation.Image(systemName: model.imageName))
            }
        }
    }
    
}

struct selectBookQuery: EntityQuery {
    
        /*
         EntityStringQuery协议在手动配置appintent，选择参数时支持搜索，基本没啥用
            如果不实现此方法，配置时会展示所有suggestedEntities
         */
    
//    func entities(matching string: String) async throws -> [BookEntity] {
//        
//        let bookModels:[BookModel] = BookManager.share.matchBookWithName(name: string)
//        var Books: [BookEntity] = []
//        for bookModel in bookModels {
//            Books.append(BookEntity(model:bookModel))
//        }
//        return Books
//    }
    
    
    func entities(for identifiers: [UUID]) async throws -> [BookEntity] {
        var Books: [BookEntity] = []
        _ = identifiers.compactMap { BookId in
            let model:BookModel = BookManager.share.findBookWithId(id: BookId)
            Books.append(BookEntity(model:model,id: model.id))
        }
        //用户选中的字符串，在这里组装成entities，返回给intent
        return Books
    }
    
    func suggestedEntities() async throws -> [BookEntity] {
        
        var entities:[BookEntity] = []
        if (ABManager.share.disableIntent) {
            return entities
        }
        for model:BookModel in BookManager.share.Books{
            if (model.type == .EntityTypeBusiness){
                if (ABManager.share.enableBookBusinessIntent){
                    entities.append(BookEntity(model: model, id: model.id))
                }
            }
            
            if (model.type == .EntityTypeGeneral){
                if (ABManager.share.enableBookGeneralIntent){
                    entities.append(BookEntity(model: model, id: model.id))
                }
            }
            
        }
        //展示所有的选择
        return entities
    }
}


extension selectBookQuery: EntityStringQuery {
    
    func entities(matching string: String) async throws -> [BookEntity] {

        let bookModels:[BookModel] = BookManager.share.matchBookWithName(name: string)
        var Books: [BookEntity] = []
        for bookModel in bookModels {
            Books.append(BookEntity(model:bookModel,id: bookModel.id))
        }
        return Books
    }
}
