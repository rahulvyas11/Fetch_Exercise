//
//  DessertListView.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//
import SwiftUI


struct DessertListView: View {
    @StateObject var viewModel = DessertListViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.desserts, id: \.self) { dessert in
                        DessertTile(image: dessert.strMealThumb, name: dessert.strMeal, mealID: dessert.idMeal)
                            .padding(.horizontal)
                    }
                }
            }.navigationTitle("Recipes")
            .onAppear {
                viewModel.loadDessertData()
            }
        }
    }
}



#Preview {
    DessertListView()
}
