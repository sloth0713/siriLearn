//
//  GYLManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//


class GYLManager{
    static let share = GYLManager()
    
    var GYLModels:[GYLModel] = []
    
    init() {
        self.GYLModels = [
            GYLModel(name: "share", imageName: "square.and.arrow.up", location: .GYLLocation1),
            GYLModel(name: "download", imageName: "square.and.arrow.down", location: .GYLLocation2),
            GYLModel(name: "write", imageName: "pencil.line", location: .GYLLocation3),
        ]
    }
    
    func updateGYLOfLocation(newGYL:GYLModel) {
        switch newGYL.location {
            case .GYLLocation1:
                self.GYLModels[0] = newGYL
            case .GYLLocation2:
                self.GYLModels[1] = newGYL
            case .GYLLocation3:
                self.GYLModels[2] = newGYL
            case .GYLLocation4:
                return
            case .GYLLocation5:
                return
        }
        
    }
    
    func findModelWithId(id:String) -> GYLModel{
        var findModel : GYLModel = GYLModel(name: "share", imageName: "square.and.arrow.up", location: .GYLLocation1)
        for model:GYLModel in GYLManager.share.GYLModels{
            if (model.id == id){
                findModel = model
            }
        }
        return findModel
    }
    
}
