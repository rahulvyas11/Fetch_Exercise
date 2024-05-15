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
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/filter.php?c=Dessert") else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response = try JSONDecoder().decode(DessertTilesReponse.self, from: data)
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
