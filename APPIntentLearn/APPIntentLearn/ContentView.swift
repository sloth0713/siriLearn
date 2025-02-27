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
                
                let location:Int = 0
                
                if GYLManager.share.GYLModels.count-1 > location {
                    
                    
                    if GYLManager.share.GYLModels[location].bizLineName == bizLineName1 {
                        GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylnew", imageName: "arrow.clockwise.circle", bizLineName:bizLineNameNew,metaInfo:["function":"gylnew"]),location: location)
                    }else {
                        GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylold", imageName: "square.and.arrow.up", bizLineName:bizLineName1,metaInfo:["function":"gylold"]),location: location)
                    }
                    
                } else {
                    print()
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
