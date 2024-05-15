//
//  RecipeTile.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//

import SwiftUI

struct DessertTile: View {
    
    var image: URL
    var name: String
    var mealID: String
    
    var body: some View {
        
        NavigationLink(destination: RecipeDetails(mealId: mealID)) {
            HStack {
                URLImage(url: image)
                    .frame(width: 130, height: 70)
                    .cornerRadius(10)
                    

                VStack(alignment: .leading) {
                    Text(name)
                        .bold()
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .foregroundColor(Color.black)
                }
            }
            .padding()
            .background(Color.white)  //
            .cornerRadius(10)
            .shadow(radius: 2)
            .frame(maxWidth: .infinity)
            .listRowInsets(EdgeInsets())
            
            
            
        }
        
    }
}
