//
//  AuthManager.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import Foundation
import FirebaseAuth
class AuthManager : ObservableObject {
    @Published var isLoggedIn = false
    
    private var authStateHandle: AuthStateDidChangeListenerHandle?
    
    init() {
        authStateHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
}
