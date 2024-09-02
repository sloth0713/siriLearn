//
//  schemaPhotoEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents
import CoreLocation
import CoreTransferable


@AssistantEnum(schema: .photos.assetType)
enum AssetType: String, AppEnum {
    case photo
    case video

    static let caseDisplayRepresentations: [AssetType: DisplayRepresentation] = [
        .photo: "Photo",
        .video: "Video"
    ]
}

@AssistantEntity(schema: .photos.asset)
struct schemaPhotoEntity: IndexedEntity {

    // MARK: Static

    static let defaultQuery = schemaPhotoQuery()

    // MARK: Properties

    let id: String
    let asset: String

    @Property(title: "Title")
    var title: String?

    var creationDate: Date?
    var location: CLPlacemark?
    var assetType: AssetType?
    var isFavorite: Bool
    var isHidden: Bool
    var hasSuggestedEdits: Bool

    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(stringLiteral: asset)
    }
}

extension schemaPhotoEntity {

    struct schemaPhotoQuery: EntityQuery {

        @MainActor
        //schemaPhotoEntity.ID为用户选中id
        func entities(for identifiers: [String]) async throws -> [schemaPhotoEntity] {
            
            var schemaPhotos: [schemaPhotoEntity] = []
            _ = identifiers.compactMap { photoName in
                schemaPhotos.append(schemaPhotoEntity(id: photoName, asset: photoName))
            }
            //用户选中的字符串，组装成entities，返回给intent
            return schemaPhotos
            
        }

        @MainActor
        func suggestedEntities() async throws -> [schemaPhotoEntity] {
            
            
            var entities:[schemaPhotoEntity] = []
            for schemaName:String in SchemaIntentManager.share.schemaPhotoNames(){
                entities.append(schemaPhotoEntity(id: schemaName, asset: schemaName))
            }
            return entities
        }
    }

//    static var transferRepresentation: some TransferRepresentation {
//        DataRepresentation(exportedContentType: .png) { entity in
//            try await entity.asset.pngData()
//        }
//    }
}


class schemaPhotoModel {
    var name: String
    var author: String
    
    init(name: String, author: String) {
        self.name = name
        self.author = author
    }
}

