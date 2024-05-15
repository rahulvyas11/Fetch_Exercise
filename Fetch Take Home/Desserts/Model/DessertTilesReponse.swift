//
//  DessertTilesReponse.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import Foundation

struct DessertTilesReponse: Codable {
    let meals: [Dessert]?
}

struct Dessert: Hashable, Codable, Comparable {
    let strMeal: String?
    let strMealThumb: URL?
    let idMeal: String?
    
    static func < (lhs: Dessert, rhs: Dessert) -> Bool {
        
        if let lhs = lhs.strMeal, let rhs = rhs.strMeal {
            return lhs < rhs
        }
        
        return false
    }
    
}
