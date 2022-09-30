//
//  EventManager.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/30/22.
//

import Foundation
import FirebaseDatabase
class EventManager : ObservableObject {
  @Published var events : [Event]?

  func makeFirebaseCall() {
      let ref = Database.database().reference().child("events")
      ref.observe(.value, with: { snapshot in
          guard let dictionary = snapshot.value as? [String : AnyObject] else {
                return
          }
          var dbEvents : [Event] = []
          for value in dictionary.values{
              let event = Event(uid: value["uid"] as! String, username: value["username"] as! String, sport: value["sport"] as! String, details: value["details"] as! String, location: value["location"] as! String, date: Date.now, locationImageURL: value["locationImageURL"] as! String)
              dbEvents.append(event)
          }
          
          self.events = dbEvents
      })
      
    
  }
    func getDateFromString(date: String) -> Date?{
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
        return formatter.date(from: date)
    }
    
}
