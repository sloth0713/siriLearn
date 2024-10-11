//
//  BookModel.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/20.
//

import Foundation

struct BookModel : Identifiable, Hashable, Sendable {
    var id: String
    
    var name: String
    var author: String
    var imageName: String
    var imageUrl: URL
    var type: EntityType
    
    init(name: String, author: String,imageName:String,imageUrl:URL,type:EntityType) {
        self.id = name
        self.name = name
        self.author = author
        self.imageName = imageName
        self.imageUrl = imageUrl
        self.type = type
    }
}
