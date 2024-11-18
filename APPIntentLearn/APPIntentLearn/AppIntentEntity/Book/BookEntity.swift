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

struct BookEntity: AppEntity, Identifiable{
    
    var model: BookModel
    var id: String
    
    static var defaultQuery = selectBookQuery()
    static var typeDisplayRepresentation: TypeDisplayRepresentation = TypeDisplayRepresentation(name: LocalizedStringResource("chose a page you want to go"))
    
    var displayRepresentation: DisplayRepresentation {
        
        if (ABManager.share.useOnlineIntentIcon){
            if (model.type == .EntityTypeBusiness){
                let image = UIImage(contentsOfFile: model.imageUrl.path)!
                let data:Data = image.pngData()!
                
                return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: model.name),
                                             subtitle: LocalizedStringResource(stringLiteral: model.author),
                                             image: DisplayRepresentation.Image(data: data))//appintent
            }else{
                return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: model.name),
                                             image: DisplayRepresentation.Image(systemName: model.imageName))
            }
            
        }else{
            if (model.type == .EntityTypeBusiness){
                return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: model.name),
                                             subtitle: LocalizedStringResource(stringLiteral: model.author),
                                              image: DisplayRepresentation.Image(named: model.imageName))
            }else{
                return DisplayRepresentation(title: LocalizedStringResource(stringLiteral: model.name),
                                             image: DisplayRepresentation.Image(systemName: model.imageName))
            }
        }
    }
    
}

@available(iOS 18, *)
extension BookEntity: IndexedEntity
{
    var attributeSet:CSSearchableItemAttributeSet {
        let attributed = CSSearchableItemAttributeSet()
//        attributed.keywords = ["jjj \(model.author)"]
        attributed.displayName = "jjj \(model.author)"
        let searchableItems = [CSSearchableItem(uniqueIdentifier: "jjj \(model.author)",
                                          domainIdentifier: "dsaf", // TODO: put app's bundle id here
                                          attributeSet: attributed)]
        CSSearchableIndex.default().indexSearchableItems(searchableItems) { error in
          if let error = error {
            print("Unable to index item: \(error)")
          }else {
              print("index item success")
          }
        }
        return attributed
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
//            Books.append(BookEntity(model:bookModel,id: bookModel.id))
//        }
//        return Books
//    }
    
    
    func entities(for identifiers: [BookEntity.ID]) async throws -> [BookEntity] {
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

        let bookModels:[BookModel] = BookManager.share.Books
        var Books: [BookEntity] = []
        for bookModel in bookModels {
            Books.append(BookEntity(model:bookModel,id: bookModel.id))
        }
        return Books
    }
}
