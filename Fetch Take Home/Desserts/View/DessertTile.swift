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
                    .frame(width: 130, height: 100)
                    .cornerRadius(10)
                    

                VStack(alignment: .leading) {
                    MediumText(text:name)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .foregroundColor(Color.black)
                }.padding(.horizontal)
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
