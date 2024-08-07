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
        APPIntentTestWidgetControl()
        APPIntentTestWidgetLiveActivity()
//        StaticWidgetControlToogle()//这个不知道为啥也需要注释
        StaticWidgetControlButton()//这个不知道为啥也需要注释
    }
}
