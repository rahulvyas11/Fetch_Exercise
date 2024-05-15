//
//  RecipeDetailsViewModel.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import Foundation

class RecipeDetailsViewModel: ObservableObject {
    
    @Published var recipes: RecipeDetailsModel?
    
    func loadRecipeDetails(mealID: String)
    {
        guard let url = URL(string: "https://themealdb.com/api/json/v1/1/lookup.php?i=\(mealID)") else { return }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let recipeList = try JSONDecoder().decode(RecipeList.self, from: data)
                DispatchQueue.main.async {

                    if let meals = recipeList.meals {
                        if(!meals.isEmpty) {
                            self?.recipes = meals[0]
                        }
                    }
                }
            }
            
            catch{
                print(error)
            }
        }
        task.resume()
    }
}

extension RecipeDetailsViewModel {
    func thumbNailURL() -> URL {
        return recipes?.strMealThumb ?? URL(fileURLWithPath: "")
    }
    
    func recipeName() -> String {
        return recipes?.strMeal ?? ""
    }
    
    func cuisine()-> String {
        return recipes?.strArea ?? ""
    }
    
    func instructions()->String {
        return recipes?.strInstructions ?? ""
    }
    
    
    
    func ingredient1() -> String {
        return recipes?.strIngredient1 ?? ""
    }
    
    func ingredient2() -> String {
        return recipes?.strIngredient2 ?? ""
    }
    func ingredient3() -> String {
        return recipes?.strIngredient3 ?? ""
    }
    func ingredient4() -> String {
        return recipes?.strIngredient4 ?? ""
    }
    func ingredient5() -> String {
        return recipes?.strIngredient5 ?? ""
    }
    func ingredient6() -> String {
        return recipes?.strIngredient6 ?? ""
    }
    func ingredient7() -> String {
        return recipes?.strIngredient7 ?? ""
    }
    func ingredient8() -> String {
        return recipes?.strIngredient8 ?? ""
    }
    func ingredient9() -> String {
        return recipes?.strIngredient9 ?? ""
    }
    func ingredient10() -> String {
        return recipes?.strIngredient10 ?? ""
    }
    func ingredient11() -> String {
        return recipes?.strIngredient11 ?? ""
    }
    func ingredient12() -> String {
        return recipes?.strIngredient12 ?? ""
    }
    func ingredient13() -> String {
        return recipes?.strIngredient13 ?? ""
    }
    func ingredient14() -> String {
        return recipes?.strIngredient14 ?? ""
    }
    func ingredient15() -> String {
        return recipes?.strIngredient15 ?? ""
    }
    func ingredient16() -> String {
        return recipes?.strIngredient16 ?? ""
    }
    func ingredient17() -> String {
        return recipes?.strIngredient17 ?? ""
    }
    func ingredient18() -> String {
        return recipes?.strIngredient18 ?? ""
    }
    func ingredient19() -> String {
        return recipes?.strIngredient19 ?? ""
    }
    func ingredient20() -> String {
        return recipes?.strIngredient20 ?? ""
    }
    
    
    func measurement1()->String
    {
        return recipes?.strMeasure1 ?? ""
    }
    func measurement2()->String
    {
        return recipes?.strMeasure2 ?? ""
    }
    func measurement3()->String
    {
        return recipes?.strMeasure3 ?? ""
    }
    func measurement4()->String
    {
        return recipes?.strMeasure4 ?? ""
    }
    func measurement5()->String
    {
        return recipes?.strMeasure5 ?? ""
    }
    func measurement6()->String
    {
        return recipes?.strMeasure6 ?? ""
    }
    func measurement7()->String
    {
        return recipes?.strMeasure7 ?? ""
    }
    func measurement8()->String
    {
        return recipes?.strMeasure8 ?? ""
    }
    func measurement9()->String
    {
        return recipes?.strMeasure9 ?? ""
    }
    func measurement10()->String
    {
        return recipes?.strMeasure10 ?? ""
    }
    func measurement11()->String
    {
        return recipes?.strMeasure11 ?? ""
    }
    func measurement12()->String
    {
        return recipes?.strMeasure12 ?? ""
    }
    func measurement13()->String
    {
        return recipes?.strMeasure13 ?? ""
    }
    func measurement14()->String
    {
        return recipes?.strMeasure14 ?? ""
    }
    func measurement15()->String
    {
        return recipes?.strMeasure15 ?? ""
    }
    func measurement16()->String
    {
        return recipes?.strMeasure16 ?? ""
    }
    func measurement17()->String
    {
        return recipes?.strMeasure17 ?? ""
    }
    func measurement18()->String
    {
        return recipes?.strMeasure18 ?? ""
    }
    func measurement19()->String
    {
        return recipes?.strMeasure19 ?? ""
    }
    func measurement20()->String
    {
        return recipes?.strMeasure20 ?? ""
    }
    
    func ingredientMeasurePairs() -> [(ingredient: String, measurement: String)] {
        // Retrieve lists
        let ingredients = [
            ingredient1(),
            ingredient2(),
            ingredient3(),
            ingredient4(),
            ingredient5(),
            ingredient6(),
            ingredient7(),
            ingredient8(),
            ingredient9(),
            ingredient10(),
            ingredient11(),
            ingredient12(),
            ingredient13(),
            ingredient14(),
            ingredient15(),
            ingredient16(),
            ingredient17(),
            ingredient18(),
            ingredient19(),
            ingredient20(),
        ]
        let measurements = [
            measurement1(),
            measurement2(),
            measurement3(),
            measurement4(),
            measurement5(),
            measurement6(),
            measurement7(),
            measurement8(),
            measurement9(),
            measurement10(),
            measurement11(),
            measurement12(),
            measurement13(),
            measurement14(),
            measurement15(),
            measurement16(),
            measurement17(),
            measurement18(),
            measurement19(),
            measurement20(),
        ]

        let zippedPairs = zip(ingredients, measurements)
        let filteredPairs = zippedPairs.filter { !$0.0.isEmpty && !$0.1.isEmpty }
        
        return Array(filteredPairs)
    }

    
    func hasRecipeLoaded() -> Bool {
        return recipes != nil
    }
}
