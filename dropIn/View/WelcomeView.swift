//
//  WelcomeView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/18/22.
//

import SwiftUI
import SwiftUISegues

struct WelcomeView: View {
    let welcomeMessage = "Welcome, interested in running a pickup game or joining a fun activity around you? Well, just drop in..."
    enum Route: Hashable {
        case segueToLoginView
        case segueToSignupView
       }
    @State private var route: Route? = nil
    var body: some View {
        
        
        NavigationView{
            GeometryReader { geo in
                VStack(spacing: 0) {
                    
                    //top view
                    VStack(){
                        /*
                        Spacer()
                        HStack(){
                            VStack{
                                Image(systemName: "figure.soccer")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(systemName: "figure.softball")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .padding(20)
                            VStack{
                                Image(systemName: "figure.tennis")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                Image(systemName: "figure.volleyball")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                            }
                            .padding(20)
                        }
                        .background()
                        .cornerRadius(10)*/
                        
                        Text("DropIn")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .padding([.leading, .bottom], 5.0)
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.7)
                    .background(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
                    
                    
                    //bottom view
                    VStack(alignment: .center, spacing: 0.0) {
                        Text(welcomeMessage)
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 10.0)
                            .frame(maxWidth: .infinity, alignment: .top)
                        
                        Spacer()
                            .frame(minHeight: 0, maxHeight: 30)
                        HStack(){
                            Button("Log In") {
                                route = .segueToLoginView
                            }
                            .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                            .foregroundColor(Color.black)
                            Button("Sign Up") {
                                route = .segueToSignupView
                            }
                            .frame(minWidth: 0, maxWidth: .infinity,  minHeight: 44)
                            .foregroundColor(Color.white)
                            .background(Color(UIColor(red:0.15, green:0.20, blue:0.22, alpha:1.0)))
                        }
                        .background(Color(UIColor(red:0.85, green:0.85, blue:0.85, alpha:1.0)))
                        .cornerRadius(35)
                        .padding(20)
                        
                    }
                    
                    .frame(width: geo.size.width, height: geo.size.height * 0.3)
                    .background(Color(UIColor(red:0.83, green:0.82, blue:0.80, alpha:1.0)))
                    
                    
                }
            }
            
            
            // Here are individual, mixed segues, with their destinations
            .segue(.push, tag: .segueToLoginView, selection: $route) {
                LoginView()
            }
            .segue(.push, tag: .segueToSignupView, selection: $route) {
                SignupView()
            }
        }
        .accentColor(.white)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
