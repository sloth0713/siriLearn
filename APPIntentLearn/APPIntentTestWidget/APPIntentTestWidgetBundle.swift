//
//  APPIntentTestWidgetBundle.swift
//  APPIntentTestWidget
//
//  Created by ByteDance on 2024/8/7.
//

import WidgetKit
import SwiftUI

//@main
struct APPIntentTestWidgetBundle: WidgetBundle {
    var body: some Widget {
//        APPIntentTestWidget() 需要注释
//        APPIntentTestWidgetControl()
//        APPIntentTestWidgetLiveActivity()
        
        //使用extension调试时最多配置一个widget，否则会报错
//        StaticWidgetControlToogle()
        StaticWidgetControlButton()
//        OpenAppWidgetControl()
        ConfiguredWidgetControl()
//        TimerLiveActivityControl()
//        WidgetLiveActivity()
        
    }
}

@available(iOS 18, *)
@main
struct AwemeWidgetLaunch {
    static func main() {
        APPIntentTestWidgetBundle.main()
        saveWidgetState()
    }
    
    static func saveWidgetState() {
        let appGroupName = "group.APPIntentLearn"
        guard let shareStorage = UserDefaults(suiteName: appGroupName) else {
            return
        }
        
        var captureWidgetState:String = "-1,-1"
        if let savedState = shareStorage.string(forKey: KTTKWidgetStateCaptureWidget) {//改成appgroup
            captureWidgetState = savedState
        }
        
        let stateArray = captureWidgetState.components(separatedBy: ",")
        if stateArray.count == 2 {
            let installState:String = stateArray[0]
            let ABState:String = "0"
            captureWidgetState = installState + "," + ABState
            shareStorage.set(captureWidgetState, forKey: KTTKWidgetStateCaptureWidget)
        }
    }
}
