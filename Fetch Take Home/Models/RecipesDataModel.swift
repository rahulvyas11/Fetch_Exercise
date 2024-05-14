//
//  RecipesDataModel.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//

import Foundation

struct RecipesDataModel: Encodable {
    var meals: [RecipeTileDataModel]?
}

struct RecipeTileDataModel: Encodable {
    var strMeal: String?
    var strMealThumb: String?
    var idMeal: String?
}
