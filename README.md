# Sweet Dreams App
## Installation
Open the xcodeproj file and build the project. Fetch_Take_HomeApp is the main function.
Compatible with IOS Versions 15.0 and Up. 

## Overview
This app allows users with limited ingredients to cook quick and simple desserts from all over the world!

## Modules
I created two modules, one for showcasing the list of dessert recipes available to the user when they launch the app, and the other that shows the detailed recipe when the user clicks on a particular tile.
Both modules follow the Model-View-ViewModel Architecture, with seperate directory folders for each component of this architecture.

### 1. Dessert List Module
This module displays a list of desserts, each represented as a tile with a thumbnail image and name of the dessert. Users can scroll through this list and click on any tile to view a detailed recipe for the item selected.

#### Components:
- **Model**: `DessertTilesReponse.swift` - Defines the data structure when fetching the list of meals in the Dessert category. (https://themealdb.com/api/json/v1/1/filter.php?c=Dessert) 
- **View**: `DessertTile.swift` - Presents Data in Each Tile in a specific format. `DessertListView`- Presents all the tiles as a list that the user can scroll through
- **ViewModel**: `DessertListViewModel.swift` - Manages the fetching and state of dessert data displayed by the view.

### 2. Recipe Details Module
Upon selecting a dessert, this module provides a detailed view of the recipe, including ingredients, cooking instructions, and button to watch youtube tutorial.

#### Components:
- **Model**: `RecipeDetailsModel.swift` - Defines the data structure when fetching recipe details by mealID. (https://themealdb.com/api/json/v1/1/lookup.php?i=MEAL_ID)
- **View**: `IngredientsView.swift` - Display the ingredients and measurement data in a grid format. `InstructionsView.swift` - Display the recipe instructions in a numbered format. `RecipeDetails.swift`-Display Dish name,ingredients, and instructions when user clicks desserts tile.
- **ViewModel**: `RecipeDetailsViewModel.swift` - Manages the fetching and state of recipe data for the selected dessert.






