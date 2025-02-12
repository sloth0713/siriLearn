//
//  GYLManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import Foundation

class GYLManager{
    static let share = GYLManager()
    
    var GYLModels:[GYLLocation:GYLModel] = [:]
    
    init() {
        //读旧的GYLModels，存储到self.GYLModels
        
//        self.staticInitGYL()
        
        self.updateGYLFromStorage()
        self.updateGYLFromSettings()
        self.saveGYL()
    }
    
    func staticInitGYL () {
        self.GYLModels = [
            .GYLLocation1:GYLModel(name: "gylold", imageName: "square.and.arrow.up", location: .GYLLocation1,bizLineName:bizLineName1,metaInfo:["function":"gylold"]),
            
            .GYLLocation2:GYLModel(name: "download", imageName: "square.and.arrow.down", location: .GYLLocation2,bizLineName:bizLineName2,metaInfo:["function":"download"]),
            
            .GYLLocation3:GYLModel(name: "write", imageName: "pencil.line", location: .GYLLocation3,bizLineName:bizLineName3,metaInfo:["function":"write"])
        ]
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
    
    func updateGYLFromSettings() {

        let dict:[String:Any] = ["name":"gylSetting","imageName":"fan","location":"GYLLocation3","bizLineName":bizLineNameSetting,"metaInfo":["function":"aa"]]
        
        let dictArray:[[String:Any]] = [dict]
        
        for dict in dictArray {
            let model = GYLModel(dict: dict)
            
            if model.valid {
                self.GYLModels[model.location] = model
            }
        }
    }
    
    func updateGYLFromStorage() {
        if let fileURL = self.gylPath() {
    
            do {
                let data = try Data(contentsOf: fileURL)
                
                if let dictArray = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]] {
                    print("Dictionary array loaded successfully:")
                    print(dictArray)
                    
                    for dict in dictArray {
                        let model = GYLModel(dict: dict)
                        
                        if model.valid {
                            self.GYLModels[model.location] = model
                        }
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func saveGYL() {
        //存储GYLmodels
        var dictArray = [[String:Any]]()
        for model in self.GYLModels.values {
            dictArray.append(model.transfer2Dict())
        }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: dictArray, options: [])
            
            if let fileURL = self.gylPath() {
                
                try data.write(to: fileURL)
                print("Data saved to file: \(fileURL.path)")
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }
    
    func updateGYLOfLocation(newGYL:GYLModel) {
        self.GYLModels[newGYL.location] = newGYL
        //存储gylmodel
        self.saveGYL()
    }
    
    func findModelWithId(id:String) -> GYLModel{
        var findModel : GYLModel = GYLModel(name: "default", imageName: "play.fill", location: .GYLLocation1,bizLineName:bizLineNameDefault,metaInfo:["function":"default"])
        for model:GYLModel in GYLManager.share.GYLModels.values{
            if (model.id == id){
                findModel = model
            }
        }
        return findModel
    }
    
}
