//
//  ProfileView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI
import FirebaseAuth

struct ProfileView: View {
    @StateObject private var eventManager = EventManager()
    var body: some View {
        GeometryReader { geo in
            VStack(){
                
                Rectangle()
                    .fill(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
                    .edgesIgnoringSafeArea(.top)
                    .frame(width: geo.size.width, height: geo.size.height * 0.1)
                
                ZStack{
                    
                    Image(systemName: "person.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: geo.size.width, height: geo.size.height * 0.4)
                        .cornerRadius(15)
                        
                }.frame(width: geo.size.width, height: geo.size.height * 0.4)
                Text("Chris Carbajal")
                    .font(.title)
                Text("Phoenix, AZ")
                    .font(.caption)
                VStack{
                    HStack{
                        Text("My Events")
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                            .padding()
                        Spacer()
                        Text("See all")
                            .fontWeight(.light)
                            .frame(alignment: .trailing)
                            .padding()
                    }
                    
                    ScrollView(.horizontal) {
                     
                        HStack(spacing: 5) {
                            if eventManager.events != nil {
                                
                                let events = eventManager.events!
                                ForEach(events, id: \.uid) { event in
                                    let card  = Card(img: event.sport.lowercased(), title: event.sport, subTitle: event.details, createdBy: event.username)
                                    CardView(card: card)
                                        .frame(width: 250, height: 150)
                                    }
                                
                            }
                        }
                        .padding(.bottom, 5)
                        
                    }
                    .frame(width: geo.size.width, height: geo.size.height * 0.25, alignment: .bottom)
                }
                Spacer()
                Button("Log out"){
                    do {
                        try Auth.auth().signOut()
                    } catch let signOutError as NSError {
                        print("Error signing out: %@", signOutError)
                    }
                }
                .padding(10)
            }
        }.onAppear{
            print("rendered profile view")
            //eventManager.makeFirebaseCall()

        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
