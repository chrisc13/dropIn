//
//  User.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import Foundation
import FirebaseAuth
import FirebaseDatabase

class User{
    var username : String = ""
    var email : String = ""
    var profileImageURL : String = ""
    
    init(username : String, email : String, profileImageURL : String) {
        self.username = username
        self.email = email
        self.profileImageURL = profileImageURL
    }
    
    func getDictionary() -> Dictionary<String,Any>{
        let userInfoDictionary: [String : Any] = ["username" : self.username,
                                  "email" : self.email,
                                  "profileImageURL" : self.profileImageURL
                                                  ]
        return userInfoDictionary
    }
}

