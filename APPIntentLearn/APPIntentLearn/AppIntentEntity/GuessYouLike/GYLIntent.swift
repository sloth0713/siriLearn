//
//  GYLIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

import AppIntents
import SwiftUI

struct GYLIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Guess you like intent" }

    static var openAppWhenRun = true
    
    @Parameter(title: "you like")
    var Entity: GYLEntity

    func perform() async throws -> some IntentResult {
        
        let meta:[String:String] = Entity.model.metaInfo
        if (meta[bizLineNameKey] == bizLineName1){
            self.performBizLine1WithMeta(meta: meta)
        }else if (meta[bizLineNameKey] == bizLineName2){
            self.performBizLine2WithMeta(meta: meta)
        }
        else if (meta[bizLineNameKey] == bizLineName3){
            self.performBizLine3WithMeta(meta: meta)
        }
        else if (meta[bizLineNameKey] == bizLineNameNew){
            self.performBizLineNewWithMeta(meta: meta)
        }
        else if (meta[bizLineNameKey] == bizLineNameDefault){
            self.performBizLineDefaultWithMeta(meta: meta)
        }
        
        return .result()
    }
    
    
    func performBizLine1WithMeta(meta:[String:String]) {
        if  let function:String = meta["function"]{
            print("go to \(function)")
        }
    }
    
    func performBizLine2WithMeta(meta:[String:String]) {
        if  let function:String = meta["function"]{
            print("go to \(function)")
        }
    }
    
    func performBizLine3WithMeta(meta:[String:String]) {
        if  let function:String = meta["function"]{
            print("go to \(function)")
        }
    }
    
    func performBizLineNewWithMeta(meta:[String:String]) {
        if  let function:String = meta["function"]{
            print("go to \(function)")
        }
    }
    
    func performBizLineDefaultWithMeta(meta:[String:String]) {
        if  let function:String = meta["function"]{
            print("go to \(function)")
        }
    }
    
}
