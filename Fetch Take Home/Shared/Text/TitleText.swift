//
//  TitleText.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct TitleText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Epilogue", size: 30))
            .bold()
            
    }
}

#Preview {
    TitleText(text: "Dish Name")
}
