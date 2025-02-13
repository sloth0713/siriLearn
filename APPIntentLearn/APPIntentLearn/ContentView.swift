//
//  ContentView.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI

@available(iOS 17.2, *)
struct ContentView: View {
//    var current:int
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(.now, style: .timer)
            Button {
                ABManager.share.disableIntent = false
                EntAppIntentShortcuts.updateAppShortcutParameters()
            } label: {
                Label("open intent", systemImage: "lock.open")
            }
            
            
            Button {
                ABManager.share.disableIntent = true
                EntAppIntentShortcuts.updateAppShortcutParameters()
            } label: {
                Label("close intent", systemImage: "lock")
            }
            
            Button {
                
                if let model:GYLModel = GYLManager.share.GYLModels[.GYLLocation1] {
                    if model.bizLineName == bizLineName1 {
                        GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylnew", imageName: "arrow.clockwise.circle", location: .GYLLocation1,bizLineName:bizLineNameNew,metaInfo:["function":"gylnew"]))
                    }else {
                        GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylold", imageName: "square.and.arrow.up", location: .GYLLocation1,bizLineName:bizLineName1,metaInfo:["function":"gylold"]))
                    }
                }
                
                for _ in 0...10 {
                    EntAppIntentShortcuts.updateAppShortcutParameters()
                }
                
            } label: {
                Label("update GYL", systemImage: "arrow.clockwise.circle")
            }

        }
        .padding()
    }
    
    
}

@available(iOS 17.2, *)
#Preview {
    ContentView()
}
