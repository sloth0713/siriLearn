//
//  schemaPhotoEntity.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/9.
//

import AppIntents
import CoreLocation
import CoreTransferable

@available(iOS 18.0, *)
@AssistantEnum(schema: .photos.assetType)
enum AssetType: String, AppEnum {
    case photo
    case video

    static let caseDisplayRepresentations: [AssetType: DisplayRepresentation] = [
        .photo: "Photo",
        .video: "Video"
    ]
}

@available(iOS 18.0, *)
@AssistantEntity(schema: .photos.asset)
struct schemaPhotoEntity: IndexedEntity {

    // MARK: Static

    static let defaultQuery = schemaPhotoQuery()

    var model:schemaPhotoModel
    var id: UUID
    var asset: String?

    @Property(title: "Title")
    var title: String?

    var creationDate: Date?
    var location: CLPlacemark?
    var assetType: AssetType?
    var isFavorite: Bool
    var isHidden: Bool
    var hasSuggestedEdits: Bool
    
    init(model: schemaPhotoModel) {
        self.model = model
        self.id = model.id
        self.asset = model.asset
        self.title = model.name
    }
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(model.name)",
                              subtitle: "\(model.author)",
                              image: DisplayRepresentation.Image(named: model.asset))
    }
}

@available(iOS 18.0, *)
extension schemaPhotoEntity {

    struct schemaPhotoQuery: EntityQuery {

        @MainActor
        //schemaPhotoEntity.ID为用户选中id
        func entities(for identifiers: [UUID]) async throws -> [schemaPhotoEntity] {
            
            var schemaPhotos: [schemaPhotoEntity] = []
            _ = identifiers.compactMap { id in
                let model:schemaPhotoModel = SchemaIntentManager.share.findPhotoWithName(id: id)
                schemaPhotos.append(schemaPhotoEntity(model: model))
            }
            //用户选中的字符串，组装成entities，返回给intent
            return schemaPhotos
            
        }

        @MainActor
        func suggestedEntities() async throws -> [schemaPhotoEntity] {
            
            var entities:[schemaPhotoEntity] = []
            for model:schemaPhotoModel in SchemaIntentManager.share.SchemaPhotos {
                entities.append(schemaPhotoEntity(model: model))
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

