//
//  GYLModel.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import Foundation

let bizLineName1: String = "bizLineName1"
let bizLineName2: String = "bizLineName2"
let bizLineName3: String = "bizLineName3"
let bizLineNameNew: String = "bizLineNameNew"
let bizLineNameDefault: String = "bizLineNameDefault"

enum GYLLocation{
    case GYLLocation1,GYLLocation2,GYLLocation3,GYLLocation4,GYLLocation5//iphone 3个，ipad 5个
}

let allGYL:[GYLLocation] = [.GYLLocation1,.GYLLocation2,.GYLLocation3,.GYLLocation4,.GYLLocation5]

struct GYLModel : Identifiable, Hashable, Sendable {
    var id: String
    
    var name: String
    var imageName: String
    var bizLineName: String
    var metaInfo:[String:String]
    var location: GYLLocation
    var valid: Bool = true
    
    init(name: String,imageName:String,location:GYLLocation,bizLineName:String,metaInfo:[String:String]) {
        self.name = name
        self.imageName = imageName
        self.location = location
        self.bizLineName = bizLineName
        self.metaInfo = metaInfo
        self.id = Self.stringFromLocation(location: location)
    }
    
    init(dict:[String:Any]) {
        
        if let name = dict["name"] as? String {
            self.name = name
        } else {
            self.name = "unknown"
            self.valid = false
        }
        
        if let imageName = dict["imageName"] as? String {
            self.imageName = imageName
        } else {
            self.imageName = "unknown"
            self.valid = false
        }
        
        if let location = dict["location"] as? String {
            self.location = Self.LocationFromString(location: location)
            self.id = Self.stringFromLocation(location: self.location)
        } else {
            self.location = .GYLLocation1
            self.id = "unknown"
            self.valid = false
        }
        
        if let bizLineName = dict["bizLineName"] as? String {
            self.bizLineName = bizLineName
        } else {
            self.bizLineName = "unknown"
            self.valid = false
        }
        
        if let metaInfo = dict["metaInfo"] as? [String:String] {
            self.metaInfo = metaInfo
        } else {
            self.metaInfo = ["no":"no"]
            self.valid = false
        }
    }
    
    
    static func stringFromLocation(location:GYLLocation) -> String {
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
    
    static func LocationFromString(location:String) -> GYLLocation {
        
        if location == "GYLLocation1" {
            return .GYLLocation1
        }
        if location == "GYLLocation2" {
            return .GYLLocation2
        }
        if location == "GYLLocation3" {
            return .GYLLocation3
        }
        if location == "GYLLocation4" {
            return .GYLLocation4
        }
        if location == "GYLLocation5" {
            return .GYLLocation5
        }
        
        return .GYLLocation1
    }
    
    func transfer2Dict() -> [String:Any]{
        
        let dict = ["name":name, "imageName":imageName, "bizLineName":bizLineName,"metaInfo":metaInfo, "location":Self.stringFromLocation(location: location)] as [String : Any]
        
        return dict
    }
    
    func DictTransfer2Model() -> [String:Any]{
        
        let dict = ["name":name, "imageName":imageName, "bizLineName":bizLineName,"metaInfo":metaInfo, "location":Self.stringFromLocation(location: location)] as [String : Any]
        
        return dict
    }
}
