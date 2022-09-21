//
//  dropInApp.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/17/22.
//

import SwiftUI
import Firebase

@main
struct dropInApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
