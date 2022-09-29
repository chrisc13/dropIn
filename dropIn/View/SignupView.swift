//
//  SignupView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/22/22.
//

import SwiftUI
import FirebaseAuth
import FirebaseDatabase

struct SignupView: View {
    @State private var email: String = ""
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isSecured: Bool = true
    @State private var route: Route? = nil
    
    enum Route: Hashable {
           case seguetoHomeView
       }
    
    var body: some View {
        let ref: DatabaseReference = Database.database().reference()
        NavigationView{
            GeometryReader { geo in
                VStack{
                    Text("Sign up")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(Color.white)
                    Spacer()
                    
                    VStack (spacing: 30){
                        Button(action: {
                            // Do something...
                        }, label: {
                            Image(systemName: "camera.fill")
                                .resizable()
                                .scaledToFit()
                                .padding(30)
                                .frame(width: 100, height: 100)
                                .foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.036, opacity: 0.626))
                        })
                        .background(Color(hue: 1.0, saturation: 0.011, brightness: 0.809, opacity: 0.89))
                        .clipShape(Circle())
                        
                       
                        
                        VStack (spacing: 15){
                            HStack{
                                Image(systemName: "person")
                                    .foregroundColor(.gray)
                                TextField(
                                    "Username",
                                    text: $username
                                )
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(5)
                            
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
                                Group {
                                                if isSecured {
                                                    SecureField("Password", text: $password)
                                                } else {
                                                    TextField(password, text: $password)
                                                }
                                            }
                                .autocapitalization(.none)
                                .disableAutocorrection(true)
                                Button(action: {
                                              isSecured.toggle()
                                          }) {
                                              Image(systemName: self.isSecured ? "eye.slash" : "eye")
                                                  .accentColor(.gray)
                                          }
                            }
                            .padding(10)
                            .background(.white)
                            .cornerRadius(5)
                        }
                        Button("Sign up") {
                            Auth.auth().createUser(withEmail: email, password: password) { (result, error) in
                                
                                if error != nil {
                                    print(error?.localizedDescription ?? "")
                                } else {
                                    let user = Auth.auth().currentUser
                                    if let user = user {
                                        let userInfoDictionary = ["username" : username,
                                                                   "email" : email,
                                                                   "profileImageURL" : "example.com"]
                                        
                                        ref.child("users").child(user.uid).setValue(userInfoDictionary)
                                    }
                                    
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

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView()
    }
}
