//
//  GYLManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import Foundation

class GYLManager{
    static let share = GYLManager()
    
    var GYLModels:[GYLModel] = []
    
    init() {
        //读旧的GYLModels，存储到self.GYLModels
        
        self.updateGYLFromStorage()
//        self.updateGYLFromSettings(deleteStarage: false)//最好不要作为常规手段，否则第一个和storage的不一致，可能会导致更新慢的bug
        self.staticInitGYL()
        self.saveGYL()
    }
    
    func staticInitGYL () {//优先级最低
        var staticModels:[GYLModel] = [
            GYLModel(name: "gylold", imageName: "square.and.arrow.up", bizLineName:bizLineName1,metaInfo:["function":"gylold"]),
            
            GYLModel(name: "download", imageName: "square.and.arrow.down", bizLineName:bizLineName2,metaInfo:["function":"download"]),
            
            GYLModel(name: "write", imageName: "pencil.line", bizLineName:bizLineName3,metaInfo:["function":"write"])
        ]
        
        staticModels = staticModels.filter({ GYLModel in
            for model in self.GYLModels {
                if model.bizLineName == GYLModel.bizLineName {
                    return false
                }
            }
            return true
        })
        
        self.GYLModels.append(contentsOf:staticModels)
        
    }
    
    
    func gylPath () -> URL? {
        
        let fileURL:URL?
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first {
            fileURL = documentDirectory.appendingPathComponent("data.plist")
        }else {
            fileURL = nil
        }
        return fileURL
    }
    
    func updateGYLFromSettings(deleteStarage:Bool) {

        let dictArray:[[String:Any]] = [
            ["name":"gylold","imageName":"square.and.arrow.up","bizLineName":bizLineName1,"metaInfo":["function":"gylold"]],
            ["name":"download","imageName":"square.and.arrow.down","bizLineName":bizLineName2,"metaInfo":["function":"download"]],
            ["name":"gylSetting","imageName":"fan","bizLineName":bizLineNameSetting,"metaInfo":["function":"aa"]]
        ]
        
        if deleteStarage {
            self.GYLModels = []
            for dict in dictArray {
                let model = GYLModel(dict: dict)
                if model.valid {
                    self.GYLModels.append(model)
                }
            }
        }else {
            for dict in dictArray {
                
                let model = GYLModel(dict: dict)
                if !model.valid {continue}
            
                self.GYLModels = self.GYLModels.filter({ value in
                    value.bizLineName != model.bizLineName
                })
                
                self.GYLModels.append(model)
                
            }
        }
    }
    
    func updateGYLFromStorage() {
        if let fileURL = self.gylPath() {
    
            do {
                let data = try Data(contentsOf: fileURL)
                
                if let gylDicts = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    print("Dictionary array loaded successfully:")
                    print(gylDicts)
                    
                    for dict in gylDicts {
                        let model = GYLModel(dict: dict)
                        
                        if !model.valid {continue}
                            
                        self.GYLModels = self.GYLModels.filter({ value in
                            value.bizLineName != model.bizLineName
                        })
                            
                        self.GYLModels.append(model)
                        
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveGYL() {
        //存储GYLmodels
        var dict : [[String:Any]] = []
        for model in self.GYLModels {
            dict.append(model.transfer2Dict())
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dict, options: [])
            
            if let fileURL = self.gylPath() {
                
                try data.write(to: fileURL)
                print("Data saved to file: \(fileURL.path)")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    @available(iOS 17.2, *)
    func updateGYLOfLocation(newGYL:GYLModel, location:Int) {
        Timer.scheduledTimer(withTimeInterval: 3, repeats: false) { _ in
            self.updateGYLOfLocationImmediately(newGYL: newGYL, location: location)
        }
    }
    
    @available(iOS 17.2, *)
    func updateGYLOfLocationImmediately(newGYL:GYLModel, location:Int) {
        
        self.GYLModels = self.GYLModels.filter{ $0.bizLineName != newGYL.bizLineName}
        self.GYLModels.insert(newGYL, at: location)

        //存储gylmodel
        self.saveGYL()
        
        EntAppIntentShortcuts.updateAppShortcutParameters()
    }
    
    func getCurrentBizlineNames() -> [String] {
        var array:[String] = []
        for model in GYLModels {
            array.append(model.bizLineName)
        }
        return array
    }
    
    func findModelWithId(id:String) -> GYLModel{
        var findModel : GYLModel = GYLModel(name: "default", imageName: "play.fill", bizLineName:bizLineNameDefault,metaInfo:["function":"default"])
        for model:GYLModel in GYLManager.share.GYLModels{
            if (model.id == id){
                findModel = model
            }
        }
        return findModel
    }
    
}
