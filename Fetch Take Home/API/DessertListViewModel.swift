//
//  ViewModel.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//

import Foundation
import SwiftUI
struct Dessert: Hashable, Codable {
    let strMeal: String
    let strMealThumb: URL
    let idMeal: String
}

// New struct to model the JSON structure
struct Response: Codable {
    let meals: [Dessert]
}

class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    
    func loadDessertData() {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            
            do {
                let response = try JSONDecoder().decode(Response.self, from: data)
                DispatchQueue.main.async {
                    self?.desserts = response.meals
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
