//
//  CardView.swift
//  dropIn
//
//  Created by Chris Carbajal on 9/28/22.
//

import SwiftUI

struct CardView: View {
    let card: Card

    var body: some View {
        GeometryReader { geo in
            VStack {
                Image(systemName: "soccerball")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .padding(15)
                    
                
                HStack {
                    VStack(alignment: .leading) {
                        Text(card.title)
                            .font(.headline)
                            .foregroundColor(.secondary)
                        Text(card.subTitle)
                            .font(.title)
                            .fontWeight(.black)
                            .foregroundColor(.primary)
                            .lineLimit(3)
                        Text(card.createdBy.uppercased())
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    .layoutPriority(100)
                    
                    Spacer()
                }
                .padding()
            }
            .background(.white)
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150/255, opacity: 0.1), lineWidth: 1)
                    .shadow(radius: 5)
            )
            .padding([.top, .horizontal])
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: Card.example)
    }
}
