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
let bizLineNameSetting: String = "bizLineNameSetting"
let bizLineNameDefault: String = "bizLineNameDefault"

//enum GYLLocation{
//    case GYLLocation1,GYLLocation2,GYLLocation3,GYLLocation4,GYLLocation5//iphone 3个，ipad 5个
//}

//let allGYL:[GYLLocation] = [.GYLLocation1,.GYLLocation2,.GYLLocation3,.GYLLocation4,.GYLLocation5]

struct GYLModel : Identifiable, Hashable, Sendable {
    var id: String
    
    var name: String
    var imageName: String
    var bizLineName: String
    var metaInfo:[String:String]
    var valid: Bool = true
    
    init(name: String,imageName:String,bizLineName:String,metaInfo:[String:String]) {
        self.name = name
        self.imageName = imageName
        self.bizLineName = bizLineName
        self.metaInfo = metaInfo
        self.id = self.name
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
        
        if let bizLineName = dict["bizLineName"] as? String {
            self.bizLineName = bizLineName
            self.id = bizLineName
        } else {
            self.bizLineName = "unknown"
            self.id = "unknown"
            self.valid = false
        }
        
        if let metaInfo = dict["metaInfo"] as? [String:String] {
            self.metaInfo = metaInfo
        } else {
            self.metaInfo = ["no":"no"]
            self.valid = false
        }
    }
    
    func transfer2Dict() -> [String:Any]{
        
        let dict = ["name":name, "imageName":imageName, "bizLineName":bizLineName,"metaInfo":metaInfo] as [String : Any]
        
        return dict
    }
    
    func DictTransfer2Model() -> [String:Any]{
        
        let dict = ["name":name, "imageName":imageName, "bizLineName":bizLineName,"metaInfo":metaInfo] as [String : Any]
        
        return dict
    }
}
