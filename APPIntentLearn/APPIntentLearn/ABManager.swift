//
//  ABManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/13.
//

import Foundation

@objc class ABManager:NSObject{
    static var share : ABManager = ABManager()
    
    var useOnlineIntentIcon:Bool
    var disableIntent:Bool
    
    override init(){
        self.useOnlineIntentIcon = true
        self.disableIntent = false
    }
    
}
