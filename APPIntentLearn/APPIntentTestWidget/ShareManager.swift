//
//  ShareManager.swift
//  MyApp
//
//  Created by ByteDance on 2024/8/6.
//

import SwiftUI
import WidgetKit

let KTTKWidgetStateFileName:String = "KTTKWidgetStateFileName"
let KTTKWidgetStateCaptureWidget:String = "KTTKWidgetStateCaptureWidget"
let KTTKWidgetABVidUnknown:String = "KTTKWidgetABVidUnknown"

@available(iOS 18, *)
class ShareManager {
    static let shared = ShareManager()
    var isTurnedOn: Bool = false
    var caffeineInTake: CGFloat = 0
    var isTimerOn: Bool = false
    var isLiveActivityTimerOn: Bool = false
    
    func startTime() {
        self.isTimerOn = true
        Timer.scheduledTimer(withTimeInterval: 5.0, repeats: false) { timer in
            self.isTimerOn = false
            ControlCenter.shared.reloadAllControls()
        }
    }
    func buttonText() -> String{
        appear()
        return "ttt"
    }
    
    func appear() {
        print("widget appear")
    }
    
}
