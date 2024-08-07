//
//  APPIntentTestWidgetBundle.swift
//  APPIntentTestWidget
//
//  Created by ByteDance on 2024/8/7.
//

import WidgetKit
import SwiftUI

@main
struct APPIntentTestWidgetBundle: WidgetBundle {
    var body: some Widget {
//        APPIntentTestWidget() 需要注释
//        APPIntentTestWidgetControl()
        APPIntentTestWidgetLiveActivity()
        //使用extension调试时最多配置一个widget，否则会报错
        StaticWidgetControlToogle()
        StaticWidgetControlButton()
        OpenAppWidgetControl()
    }
}
