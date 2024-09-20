//
//  InboxManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/20.
//

import Foundation

//xiyouji,hongloumeng,sanguoyanyi,shuihuzhuan

class InboxManager{
    static let share = InboxManager()
    
    var inboxModels:[InboxModel] = []
    
    init() {
        let imageArray:[String] = ["sanguoyanyi", "xiyouji"]
        for image in imageArray{
            self.inboxModels.append(InboxModel(name: "friends_name\(image)",imageName:image,type: .EntityTypeBusiness))
        }
        self.inboxModels.append(InboxModel(name: "all your friends",imageName:"fan",type: .EntityTypeGeneral))
    }
    
    func findPeopleWithId(id:UUID) -> InboxModel?{
        for model:InboxModel in InboxManager.share.inboxModels{
            if (model.id == id){
                return model
            }
        }
        return nil
    }
    
    func matchBookWithName(name:String) -> [BookModel]{
        var findModels : [BookModel] = []
        for model:BookModel in BookManager.share.Books{
            if (model.name.contains(name)){
                findModels.append(model)
            }
        }
        return findModels
    }
    
}
