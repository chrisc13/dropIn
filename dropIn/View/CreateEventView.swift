//
//  CreateEventView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/29/22.
//

import SwiftUI
import FirebaseDatabase

struct CreateEventView: View {
    @State private var location: String = ""
    @State private var sport: String = ""
    @State private var details: String = ""
    @State private var date: String = ""
    @Binding var isPresented: Bool
    
    var body: some View {
        VStack{
            Spacer()
            Text("Create Event")
                .font(.title)
                .fontWeight(.bold)
            
            Form{
                Grid {
                    GridRow {
                        Button(action: {
                            print("soccer")
                        }, label: {
                            Image(systemName: "soccerball")
                        })
                        Button(action: {
                            print("volley")
                        }, label: {
                            Image(systemName: "volleyball")
                        })
                    }
                    
                    .padding()
                    Divider()
                    GridRow {
                        Button(action: {
                            // Do something...
                            print("football")
                        }, label: {
                            Image(systemName: "football")
                        })
                        Button(action: {
                            // Do something...
                            print("basket")
                        }, label: {
                            Image(systemName: "basketball")
                        })
                    }
                }.foregroundColor(Color(hue: 1.0, saturation: 0.012, brightness: 0.036, opacity: 0.626))
            
                Section{
                    VStack(alignment: .leading, spacing: 20){
                        TextField(
                            "Location",
                            text: $location
                        )
                        TextField(
                            "Sport",
                            text: $sport
                        )
                        TextField(
                            "Details",
                            text: $details
                        )
                    }
                }
                
                
                VStack(alignment: .leading, spacing: 20){
                    TextField(
                        "Date",
                        text: $date
                    )
                    TextField(
                        "Time",
                        text: $date
                    )
                    TextField(
                        "Players Needed",
                        text: $date
                    )
                }
            }
            HStack(spacing: 0){
                Button("Cancel") {
                    self.isPresented = false
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                .foregroundColor(Color.white)
                .background(.red)
                Button("Create") {
                    let event = Event(uid: UUID().uuidString, username: "chris13", sport: sport, details: details, location: location, date: Date.now, locationImageURL: "example.com")
                    let ref = Database.database().reference().child("events").childByAutoId()
                    ref.setValue(event.getDictionary())
                    self.isPresented = false
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 44)
                .foregroundColor(Color.white)
                .background(Color(UIColor(red:0.15, green:0.20, blue:0.22, alpha:1.0)))
            }
            
        }
    }

    
}

struct CreateEventView_Previews: PreviewProvider {
    static var previews: some View {
        CreateEventView(isPresented: .constant(true))
    }
}
