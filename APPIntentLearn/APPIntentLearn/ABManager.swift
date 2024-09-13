//
//  ABManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/13.
//

class ABManager{
    static var share : ABManager = ABManager()
    
    var useOnlineIntentIcon:Bool
    var disableIntent:Bool
    
    init(){
        self.useOnlineIntentIcon = true
        self.disableIntent = false
    }
    
}
