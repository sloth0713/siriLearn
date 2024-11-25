//
//  GYLModel.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import Foundation

let bizLineNameKey: String = "bizNameKey"
let bizLineName1: String = "bizLineName1"
let bizLineName2: String = "bizLineName2"
let bizLineName3: String = "bizLineName3"
let bizLineNameNew: String = "bizLineNameNew"
let bizLineNameDefault: String = "bizLineNameDefault"

enum GYLLocation{
    case GYLLocation1,GYLLocation2,GYLLocation3,GYLLocation4,GYLLocation5//iphone 3个，ipad 5个
}

struct GYLModel : Identifiable, Hashable, Sendable {
    var id: String
    
    var name: String
    var imageName: String
    var metaInfo:[String:String]
    var location: GYLLocation
    
    init(name: String,imageName:String,location:GYLLocation,metaInfo:[String:String]) {
        self.id = "GYLLocation0"
        self.name = name
        self.imageName = imageName
        self.location = location
        self.metaInfo = metaInfo
        self.id = self.idFromLocation(location: location)
    }
    
    func idFromLocation(location:GYLLocation) -> String {
        switch location {
        case .GYLLocation1:
            return "GYLLocation1"
        case .GYLLocation2:
            return "GYLLocation2"
        case .GYLLocation3:
            return "GYLLocation3"
        case .GYLLocation4:
            return "GYLLocation4"
        case .GYLLocation5:
            return "GYLLocation5"
        }
    }
}
