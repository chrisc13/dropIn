//
//  LoginView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/21/22.
//

import SwiftUI
import FirebaseAuth
import SwiftUISegues

struct LoginView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var route: Route? = nil
    
    enum Route: Hashable {
           case seguetoHomeView
       }
    var body: some View {
        NavigationView{
            GeometryReader { geo in
                VStack{
                    Text("Log In")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                    VStack (spacing: 30){
                        VStack (spacing: 15){
                            HStack{
                                Image(systemName: "mail")
                                    .foregroundColor(.gray)
                                TextField(
                                    "Email",
                                    text: $email
                                )
                                .autocapitalization(.none)
                                .keyboardType(.emailAddress)
                                .disableAutocorrection(true)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(5)
                            
                            
                            HStack{
                                Image(systemName: "lock")
                                    .foregroundColor(.gray)
                                SecureField(
                                    "Password",
                                    text: $password
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(5)
                        }
                        Button("Log in") {
                            Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
                                if error != nil {
                                    print(error?.localizedDescription ?? "")
                                } else {
                                    UserDefaults.standard.set(true, forKey: "UserLoggedIn")
                                    route = .seguetoHomeView
                                }
                            }
                            
                        }
                        .disabled(password.count < 6)
                        .cornerRadius(5)
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                        .foregroundColor(Color.white)
                        .background(password.count < 6 ? .gray : Color(UIColor(red:0.15, green:0.20, blue:0.22, alpha:1.0)))
                    }
                    .padding(.horizontal, 20)
                    .padding(.bottom, 10.0)
                    
                    Spacer()
                }
                .frame(width: geo.size.width, height: geo.size.height)
                .background(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
            }
        }
        .segue(.push, tag: .seguetoHomeView, selection: $route) {
            HomeView()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
