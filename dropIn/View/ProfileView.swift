//
//  ProfileView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    var body: some View {
        VStack(){
            Text("Profile view")
            Spacer()
            Button("Sign out"){
                do {
                    try Auth.auth().signOut()
                } catch let signOutError as NSError {
                    print("Error signing out: %@", signOutError)
                }
            }
            .padding(10)
        }
       
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
