//
//  IngredientsView.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct IngredientsView: View {
    
    var ingredientMeasurementPairs: [(ingredient: String, measurement: String)]
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 2)
    
    
    var body: some View {
        ScrollView{

            LazyVGrid(columns: columns, spacing: 20) {

                ForEach(Array(ingredientMeasurementPairs.enumerated()), id: \.0) { index, pair in

                    VStack {
                        HorizontalDividerView()
                             .padding(.vertical, 3)
                             .padding(.horizontal,-20)

                         IngredientsTile(ingredientName: pair.ingredient, measurement:pair.measurement)
                            }
                    }
                
                }
            HorizontalDividerView()
                .padding(.vertical, 3)
                .padding(.horizontal,-20)
            }
            
        }
    }


struct IngredientsTile: View {
    var ingredientName:String
    var measurement: String
    var body: some View {
        VStack(alignment: .leading, spacing: 2) {
           
            
            MediumText(text: ingredientName)
                .foregroundColor(.red)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            
            MediumText(text: measurement)
                .font(.caption)
                .frame(maxWidth: .infinity, alignment: .leading)
        }
    }
}

#Preview {
    IngredientsView(ingredientMeasurementPairs: [(ingredient: "Ingredient", measurement: "0 lbs")])
}
