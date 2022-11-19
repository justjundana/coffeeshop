//
//  CoffeeDetailView.swift
//  coffeeshop
//
//  Created by Jundana Al-Basyir on 19/11/22.
//

import SwiftUI

struct CoffeeDetailView: View {
    // MARK: - PROPERTIES
    let coffeeDetails: Coffeeshop
    
    // MARK: - BODY
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray.opacity(0.4), .white], startPoint: .top, endPoint: .trailing)
                .ignoresSafeArea()
            
            VStack(alignment: .center) {
                Image(coffeeDetails.image)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 250)
                    .clipShape(Circle())
                    .overlay(content: {
                        ZStack {
                            Circle()
                                .opacity(0.4)
                            
                            VStack {
                                Image(systemName: "person.crop.circle.fill.badge.plus")
                                    .resizable()
                                    .frame(width: 60, height: 60)
                                    .foregroundStyle(.green, .blue)
                                
                                Text(coffeeDetails.name)
                                    .bold()
                            }
                            .foregroundColor(.white)
                            .font(.system(.title, design: .rounded))
                        }
                    })
                
                Text(coffeeDetails.review)
                    .font(.system(size: 18, design: .rounded))
                    .lineSpacing(6)
                    .multilineTextAlignment(.center)
                    .padding(.vertical)
                
                HStack {
                    Image(systemName: "pin.circle.fill")
                        .foregroundStyle(.red, .red.opacity(0.3))
                        .clipShape(Circle())
                    
                    Text(coffeeDetails.location)
                        .font(.system(.title2, design: .rounded))
                        .foregroundColor(.blue)
                        .padding(.vertical)
                }
            } //: VStack
            .padding()
        }
    }
}

// MARK: - PREVIEW
struct CoffeeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeDetailView(coffeeDetails: Coffeeshop(image: "bojaeatery", name: "Boja Eatery", location: "Jl. Sumatera No. 21, Kota Bandung", review: "The food is delicious, cooked just right.  Friendly service.  Cozy atmosphere with floral decorations.  There is a ~robot~ that sends the dish.  Prices are reasonable for a restaurant of its class"))
    }
}
