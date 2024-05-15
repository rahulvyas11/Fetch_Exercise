//
//  DessertTilesReponse.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import Foundation

struct DessertTilesReponse: Codable {
    let meals: [Dessert]
}

struct Dessert: Hashable, Codable {
    let strMeal: String
    let strMealThumb: URL
    let idMeal: String
}
