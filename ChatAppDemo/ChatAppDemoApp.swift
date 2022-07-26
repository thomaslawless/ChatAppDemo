//
//  ChatAppDemoApp.swift
//  ChatAppDemo
//
//  Created by Thomas Lawless III on 7/26/22.
//

import SwiftUI
import Firebase
@main
struct ChatAppDemoApp: App {
    
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
