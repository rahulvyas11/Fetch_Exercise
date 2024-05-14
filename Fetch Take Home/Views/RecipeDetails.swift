import SwiftUI

struct RecipeDetails: View {
    // Example data
    let dishImage: String = "https://www.themealdb.com//images//media//meals//adxcbq1619787919.jpg"
    let cuisine: String = "British"
    let dishName: String = "Spaghetti Carbonara"
    let ingredients: [String] = [
        "Plain Flour: 120g",
        "Caster Sugar: 60g",
        "Butter: 60g",
        "Braeburn Apples: 300g",
        "Butter: 30g",
        "Demerara Sugar: 30g",
        "Blackberrys: 120g",
        "Cinnamon: ¼ teaspoon",
        "Ice Cream: to serve"
    ]
    let instructions: String =
       """
       Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.
       Meanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.
       To serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.
       """
    let youtubeURL = URL(string: "https://www.youtube.com/watch?v=dQw4w9WgXcQ")!

    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Image("photo.on.rectangle")
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: 250)
                    .background(Color.gray)
                    .clipped()

                VStack(alignment: .leading) {
                    Text(dishName)
                        .font(.title)
                        .padding(.top, 8)

                    Text(cuisine)
                        .font(.callout)
                    
                    Button(action: {
                        UIApplication.shared.open(youtubeURL)
                    }) {
                        Text("Youtube Tutorial")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.red)
                            .cornerRadius(10)
                    }

                    Text("Ingredients:")
                        .font(.headline)
                        .padding(.top, 16)

                    ForEach(ingredients, id: \.self) { ingredient in
                        HStack {
                            Text("•")
                            Text(ingredient)
                                .padding(.leading, 5)
                        }
                    }

                    Text("Instructions:")
                        .font(.headline)
                        .padding(.top, 16)

                    Text(instructions)
                }
                .padding()
            }
        }.edgesIgnoringSafeArea(.all)
    }
}

// Preview section
struct RecipeDetails_Previews: PreviewProvider {
    static var previews: some View {
        RecipeDetails()
    }
}


               
