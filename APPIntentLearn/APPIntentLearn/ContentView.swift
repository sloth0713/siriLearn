//
//  ContentView.swift
//  APPIntentLearn
//
//  Created by ByteDance on 2024/8/7.
//

import SwiftUI

struct ContentView: View {
//    var current:int
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(.now, style: .timer)
            Button {
                ABManager.share.enableBookBusinessIntent = true
                EntAppIntentShortcuts.updateAppShortcutParameters()
            } label: {
                Label("open intent", systemImage: "lock.open")
            }
            
            
            Button {
                ABManager.share.enableBookBusinessIntent = false
                EntAppIntentShortcuts.updateAppShortcutParameters()
            } label: {
                Label("close intent", systemImage: "lock")
            }
            
            Button {
                GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylnew", imageName: "arrow.clockwise.circle", location: .GYLLocation1,metaInfo:[bizLineNameKey:bizLineNameNew,"function":"gylnew"]))
                EntAppIntentShortcuts.updateAppShortcutParameters()
            } label: {
                Label("update GYL", systemImage: "arrow.clockwise.circle")
            }

        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
