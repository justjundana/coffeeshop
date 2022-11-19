//
//  CoffeeListView.swift
//  coffeeshop
//
//  Created by Jundana Al-Basyir on 19/11/22.
//

import SwiftUI

struct CoffeeListView: View {
    @State private var searchText: String = ""
    
    private var coffeeResult: [Coffeeshop] {
        let result = CoffeeshopProvider.all()
        
        if !searchText.isEmpty {
            return result.filter {
                $0.name.lowercased().contains(searchText.lowercased())
            }
        }
        
        return result
    }
   
    private var suggestedResult: [Coffeeshop] {
        if searchText.isEmpty {
            return []
        } else {
            return coffeeResult
        }
    }

    
    var body: some View {
        VStack {
            NavigationStack {
                List(coffeeResult) { result in
                    NavigationLink(destination: {
                        CoffeeDetailView(coffeeDetails: result)
                    }){
                        HStack {
                            Image("\(result.image)")
                                .resizable()
                                .scaledToFit()
                                .cornerRadius(20)
                                .frame(width: 100)
                            
                            VStack(alignment: .leading) {
                                Text("\(result.name)")
                                    .font(.system(size: 20))
                                    .fontWeight(.bold)
                                    .padding(.bottom, 5)
                                
                                Text("\(result.location)")
                                    .font(.system(size: 16))
                                    .fontWeight(.medium)
                                    .padding(.bottom, 5)
                                
                                Text("Rating 4/5")
                                    .font(.system(size: 14))
                                    .fontWeight(.thin)
                            }
                            .padding(.horizontal, 10)
                        }
                    }
                }
                .navigationTitle("Coffee Shop")
                .searchable(
                    text: $searchText,
                    placement: .navigationBarDrawer(displayMode: .always),
                    prompt: "What do you want ?"
                ) {
                    ForEach(suggestedResult) { result in
                        Text("Looking For \(result.name) ?")
                            .searchCompletion(result.name)
                    }
                }
            }
        }
    }
}

struct CoffeeListView_Previews: PreviewProvider {
    static var previews: some View {
        CoffeeListView()
    }
}
