//
//  MainView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI

struct MainView: View {
    @State private var selectedTab = 0
    var body: some View {
        
        TabView(selection: $selectedTab) {
                HomeView()
                    .tabItem {
                        Label("Home", systemImage: "house.fill")
                    }
                    .background(Color(UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)))
                    .tag(0)
                NearbyView()
                .tabItem {
                    Label("Nearby", systemImage: "location.fill")
                }
                .tag(1)
                ProfileView()
                    .tabItem {
                        Label("Profile", systemImage: "person.fill")
                    }
                    .background(Color(UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)))
                .tag(2)
        }
        .onAppear(){
            print("main tab parent")
        }
        .accentColor(.black)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
