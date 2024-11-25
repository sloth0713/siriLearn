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
    //用户选择后自动赋值
    @Parameter(title: "you like")
    var Entity: GYLEntity

    func perform() async throws -> some IntentResult {
        print("go to \(Entity.model.name)")
        return .result()
    }
}
