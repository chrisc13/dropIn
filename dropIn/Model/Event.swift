//
//  Event.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/29/22.
//

import Foundation
class Event{
    var eventID = ""
    var uid : String = ""
    var username : String = ""
    var sport : String = ""
    var details : String = ""
    var location : String = ""
    var date : Date = Date()
    var locationImageURL : String = ""
    
    init(uid: String, username: String, sport: String, details: String, location: String, date: Date, locationImageURL: String) {
        self.uid = uid
        self.username = username
        self.sport = sport
        self.details = details
        self.location = location
        self.date = date
        self.locationImageURL = locationImageURL
    }
    
    func getDictionary() ->  Dictionary<String,Any> {
        let eventDictionary : [String : Any] = ["uid" : self.uid,
                               "username" : self.username,
                               "sport" : self.sport,
                               "details" : self.details,
                               "location" : self.location,
                                "date" : getDateString(date: self.date),
                               "locationImageURL" : self.locationImageURL
        ]
        return eventDictionary
    }
    func getDateString(date : Date) -> String{
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm E, d MMM y"
        return formatter.string(from: date)
    }
    

    
}
