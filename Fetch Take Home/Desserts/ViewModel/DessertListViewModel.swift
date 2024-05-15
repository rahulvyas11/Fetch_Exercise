//
//  DessertListViewModel.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//

import Foundation
import SwiftUI

class DessertListViewModel: ObservableObject {
    @Published var desserts: [Dessert] = []
    
    func loadDessertData() {
        APIStandard.get(url: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert", onSuccess: { data in
            do {
                let response = try JSONDecoder().decode(DessertTilesReponse.self, from: data)
                DispatchQueue.main.async {
                    if var meals = response.meals {
                        self.desserts = meals.filter { meal in
                            guard let strMeal = meal.strMeal, !strMeal.isEmpty,
                                  let idMeal = meal.idMeal, !idMeal.isEmpty,
                                  let strMealThumb = meal.strMealThumb else {
                                return false
                            }
                            return true
                        }
                    }
                }
            } catch {
                print(error)
            }
        }, onError: { error in
            print("Error in Fetching Data \(error)")
        })
    }
}
