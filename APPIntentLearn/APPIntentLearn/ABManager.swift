//
//  ABManager.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/9/13.
//

import Foundation
import AppIntents
import CoreSpotlight

@objc class ABManager:NSObject{
    static var share : ABManager = ABManager()
    
    var useOnlineIntentIcon:Bool
    var disableIntent:Bool
    var enableBookBusinessIntent:Bool
    var enableBookGeneralIntent:Bool
    
    var enableInboxBusinessIntent:Bool
    var enableInboxGeneralIntent:Bool
    
    override init(){
        self.useOnlineIntentIcon = false
        self.disableIntent = false
        self.enableBookBusinessIntent = true
        self.enableBookGeneralIntent = true
        self.enableInboxBusinessIntent = true
        self.enableInboxGeneralIntent = true
    }
    
}
