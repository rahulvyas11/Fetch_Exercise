//
//  DessertListView.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/13/24.
//
import SwiftUI

struct URLImage: View {
    let url: URL
    @State private var data: Data?
    @State private var isImageLoaded = false

    var body: some View {
        Group {
            if isImageLoaded, let data = data, let uiImage = UIImage(data: data) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 150)
                    .background(Color.gray)
            } else {
                Image(systemName: "photo.on.rectangle")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 170, height: 150)
                    .background(Color.gray)
                    .onAppear(perform: fetchData)
            }
        }
    }

    private func fetchData() {
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print("Error downloading image: \(error)")
                return
            }
            DispatchQueue.main.async {
                self.data = data
                self.isImageLoaded = true
            }
        }
        task.resume()
    }
}
struct DessertListView: View {
    @StateObject var viewModel = ViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    ForEach(viewModel.desserts, id: \.self) { dessert in
                        RecipeTile(image: dessert.strMealThumb, name: dessert.strMeal)
                            .padding(.horizontal)
                    }
                }
            }.navigationTitle("Recipes")
            .onAppear {
                viewModel.fetch()
            }
        }
    }
}



#Preview {
    DessertListView()
}
