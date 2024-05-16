import SwiftUI

struct RecipeDetails: View {
    
    var mealId: String
    
    @StateObject var recipeDetailsViewModel: RecipeDetailsViewModel = RecipeDetailsViewModel()
    
    var body: some View {
     
        ScrollView {
            VStack(alignment: .center) {
                if recipeDetailsViewModel.hasRecipeLoaded() {
                    URLImage(url: recipeDetailsViewModel.thumbNailURL())
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 300
                            )
                            .background(Color.gray)
                            .clipped()
                }
                    
                    VStack(alignment: .leading) {
                        if(recipeDetailsViewModel.hasYoutubeUrl()) {
                            Button(action: {
                                    UIApplication.shared.open(recipeDetailsViewModel.youtubeURL())
                                }) {
                                            Image("youtube_logo_final")
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: 70, height: 70)
                                }
                        }
                                   
                
                    VStack(alignment: .leading){
                        HeadingText(text: "Ingredients")
     
                        
                        IngredientsView(ingredientMeasurementPairs: recipeDetailsViewModel.ingredientMeasurePairs())
                        
                    }
                    .padding(.vertical)

                    VStack(alignment: .leading){
                        HeadingText(text: "Instructions")
                           
                        

                        InstructionsView(instructions: recipeDetailsViewModel.instructions())

                    }
                    
                    
                }
                .padding()
            }
        }    .navigationTitle(recipeDetailsViewModel.recipeName())
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal) {
                        HeadingText(text:recipeDetailsViewModel.recipeName())
                        .lineLimit(1)
                        .font(.headline)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .onAppear(perform: {
                recipeDetailsViewModel.loadRecipeDetails(mealID: mealId)
            })
    }
}

// Preview section
struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails(mealId: "52893")
    }
}


               
