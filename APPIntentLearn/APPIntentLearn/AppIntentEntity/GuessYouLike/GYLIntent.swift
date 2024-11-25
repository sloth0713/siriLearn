//
//  GYLIntent.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/11/21.
//

/*
 GYLIntent的目的是为了占位，占住app最常用的3个功能，即tophit中的功能，防止某些功能的entity其实已经消失，但是tophit中搜索仍然能搜到这个功能，这时点击功能，会出现shortcut app的报错，本质上这是一个iOS系统的bug，https://developer.apple.com/forums/thread/766051/
 但是苹果没有修复，所以我们通过GYLIntent占位的方式解决这个问题。这样能够保持tophit中的功能是永远存在的。tophit中的内容可以通过updateGYLOfLocation方法来更新
 */

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
