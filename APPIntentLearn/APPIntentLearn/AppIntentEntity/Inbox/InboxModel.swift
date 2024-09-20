//
//  InboxModel.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/20.
//

import Foundation

class InboxModel : Sendable{
    var id: UUID
    var name: String
    var imageName: String
    var type: EntityType
    
    init(name: String, imageName:String, type:EntityType) {
        self.id = UUID()
        self.name = name
        self.imageName = imageName
        self.type = type
    }
}
