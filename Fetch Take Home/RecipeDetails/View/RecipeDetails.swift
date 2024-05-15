import SwiftUI

struct RecipeDetails: View {
    
    var mealId: String
    
    @StateObject var recipeDetailsViewModel: RecipeDetailsViewModel = RecipeDetailsViewModel()

    let youtubeURL = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!
    
    var body: some View {
     
        ScrollView {
            VStack(alignment: .leading) {
                
                if recipeDetailsViewModel.hasRecipeLoaded() {
                    URLImage(url: recipeDetailsViewModel.thumbNailURL())
                            .scaledToFill()
                            .frame(maxWidth: .infinity, maxHeight: 250)
                            .background(Color.gray)
                            .clipped()
                }
                    
                    VStack(alignment: .leading) {
                        Text(recipeDetailsViewModel.recipeName())
                            .bold()
                            .font(.title)
                            .padding(.top, 8)
                    
                    
                    HStack{
                        Text(recipeDetailsViewModel.cuisine())
                            .font(.callout)
                        Spacer()
                        Button(action: {
                            UIApplication.shared.open(youtubeURL)
                        }) {
                            Text("Youtube")
                                .font(.caption)
                                .bold()
                                .foregroundColor(.white)
                                .padding(5)
                                .background(Color.red)
                                .cornerRadius(10)
                        }
                    }
                
                    VStack(alignment: .leading){
                        HeadingText(text: "Ingredients")
                            .bold()

                        
                        IngredientsView(ingredientMeasurementPairs: recipeDetailsViewModel.ingredientMeasurePairs())
                        
                    }
                    .padding(.vertical)

                    VStack(alignment: .leading){
                        HeadingText(text: "Instructions")
                            .bold()
                        

                        MediumText(text: recipeDetailsViewModel.instructions())

                    }
                    
                    
                }
                .padding()
            }
        }.edgesIgnoringSafeArea(.all)
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


               
