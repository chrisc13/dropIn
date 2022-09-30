//
//  HomeView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI
import FirebaseDatabase

struct HomeView: View {
    @State private var showingPopover = false
    @StateObject private var eventManager = EventManager()
    var body: some View {
        GeometryReader { geo in
            VStack{
                VStack{
                    HStack(){
                        Spacer()
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .clipShape(Circle())
                            .shadow(radius: 10)
                            .overlay(Circle().stroke(Color(UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)), lineWidth: 4))
                            .foregroundColor(Color(UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)))
                            .padding([.top, .trailing], 15)
                        
                    }
                    Text("Happening Now")
                        .foregroundColor(Color(UIColor(red: 0.12, green: 0.12, blue: 0.12, alpha: 1.00)))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .font(.title)
                        .fontWeight(.bold)
                        .padding()
                    ScrollView(.horizontal) {
                        HStack(spacing: 5) {
                            if eventManager.events != nil {
                                
                                let events = eventManager.events!
                                ForEach(events, id: \.uid) { event in
                                    let card  = Card(img: event.sport.lowercased(), title: event.sport, subTitle: event.details, createdBy: event.username)
                                    CardView(card: card)
                                        .frame(width: 250, height: 250)
                                    }
                                
                            }
                            
                        }
                        
                    }
                    
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.55)
                
                VStack{
                    Button("Join"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                    .background(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
                    .cornerRadius(10)
                    Button("Create") {
                               showingPopover = true
                    }
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                    .background(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
                    .cornerRadius(10)
                    .popover(isPresented: $showingPopover) {
                        CreateEventView(isPresented: $showingPopover)
                    }
                    
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.45)
                .padding(.bottom, 10)
                
            }
        }.onAppear{
            eventManager.makeFirebaseCall()

        }
        

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
