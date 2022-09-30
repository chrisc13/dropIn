//
//  HomeView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI

struct HomeView: View {

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
                    HStack{
                        CardView(card: Card.example)
                        CardView(card: Card.example)
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
                   
                    Button("Create"){
                        
                    }
                    .foregroundColor(.white)
                    .frame(width: geo.size.width * 0.9, height: geo.size.height * 0.1)
                    .background(Color(UIColor(red:0.22, green:0.24, blue:0.25, alpha:1.0)))
                    .cornerRadius(10)
                    .padding(5)
                
                    
                }
                .frame(width: geo.size.width, height: geo.size.height * 0.45)
                .padding(.bottom, 10)
                Spacer()
            }
        }
        

    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
