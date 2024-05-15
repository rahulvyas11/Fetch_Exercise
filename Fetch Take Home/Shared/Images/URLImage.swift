//
//  URLImage.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
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
                print("Error downloading image: \(url) \(error)")
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
