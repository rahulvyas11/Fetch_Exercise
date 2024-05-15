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
                    ForEach(Array(viewModel.desserts.sorted().enumerated()), id: \.element) { index, dessert in
                        DessertTile(image: dessert.strMealThumb ?? URL(fileURLWithPath: ""), name: dessert.strMeal ?? "", mealID: dessert.idMeal ?? "")
                            .padding(.horizontal)
                            .transition(.asymmetric(insertion: .opacity.combined(with: .slide), removal: .opacity))
                            .animation(.easeInOut(duration: 0.5).delay(0.1 * Double(index)), value: viewModel.desserts)
                    }
                }
            }
            .navigationTitle("Recipes")
            .onAppear {
                viewModel.loadDessertData()
            }
        }
    }
}



#Preview {
    DessertListView()
}
