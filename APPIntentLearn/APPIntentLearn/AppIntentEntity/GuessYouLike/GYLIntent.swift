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

@available(iOS 17.2, *)
struct GYLIntent: AppIntent {
    
    static var title: LocalizedStringResource { "Guess you like intent" }

    static var openAppWhenRun = true
    
    @Parameter(title: "you like")
    var Entity: GYLEntity

    func perform() async throws -> some IntentResult & ProvidesDialog {
        
        let meta:[String:String] = Entity.model.metaInfo
        var function:String = "unknown"
        switch Entity.model.bizLineName {
        case bizLineName1:
            function = self.performBizLine1WithMeta(meta: meta)
        case bizLineName2:
            function = self.performBizLine2WithMeta(meta: meta)
        case bizLineName3:
            function = self.performBizLine3WithMeta(meta: meta)
        case bizLineNameNew:
            function = self.performBizLineNewWithMeta(meta: meta)
        case bizLineNameDefault:
            function = self.performBizLineDefaultWithMeta(meta: meta)
        default:
            function = self.performBizLineDefaultWithMeta(meta: meta)
        }

        return .result(dialog: IntentDialog(stringLiteral: "你打开了 \(function)"))
    }
    
    
    func performBizLine1WithMeta(meta:[String:String]) -> String {
        if  let function:String = meta["function"]{
            print("go to \(function)")
            return function
        }
        return "unknown"
    }
    
    func performBizLine2WithMeta(meta:[String:String]) -> String {
        if  let function:String = meta["function"]{
            print("go to \(function)")
            return function
        }
        return "unknown"
    }
    
    func performBizLine3WithMeta(meta:[String:String]) -> String {
        if  let function:String = meta["function"]{
            print("go to \(function)")
            return function
        }
        return "unknown"
    }
    
    func performBizLineNewWithMeta(meta:[String:String]) -> String {
        if  let function:String = meta["function"]{
            print("go to \(function)")
            return function
        }
        return "unknown"
    }
    
    func performBizLineDefaultWithMeta(meta:[String:String]) -> String {
        if  let function:String = meta["function"]{
            print("go to \(function)")
            return function
        }
        return "unknown"
    }
    
}
