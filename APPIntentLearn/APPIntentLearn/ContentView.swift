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
                GYLManager.share.updateGYLOfLocation(newGYL:GYLModel(name: "gylnew", imageName: "arrow.clockwise.circle", location: .GYLLocation1,metaInfo:[bizLineNameKey:bizLineNameNew,"function":"gylnew"]))
                EntAppIntentShortcuts.updateAppShortcutParameters()
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
