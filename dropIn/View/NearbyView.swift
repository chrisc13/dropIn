//
//  NearbyView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/29/22.
//

import SwiftUI
import MapKit

struct NearbyView: View {
    @StateObject private var eventManager = EventManager()
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))

       var body: some View {
         
           GeometryReader { geo in
               ZStack(){
                       Map(coordinateRegion: $region)
                       .edgesIgnoringSafeArea(.top)
                   
                       VStack{
                          
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
                           
                       }.frame(width: geo.size.width, height: geo.size.height * 0.9, alignment: .bottom)
                      
                   
               }
           }.onAppear{
               print("rendered nearby view")
               //getLocation()
               //eventManager.makeFirebaseCall()

           }
       }
               
    
}

struct NearbyView_Previews: PreviewProvider {
    static var previews: some View {
        NearbyView()
    }
}
