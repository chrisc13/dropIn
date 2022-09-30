//
//  ContentView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/17/22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var authManager = AuthManager()
    var body: some View {
        if authManager.isLoggedIn{
            MainView()
        }else{
            WelcomeView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
