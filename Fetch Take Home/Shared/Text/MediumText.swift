//
//  ContentText.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct MediumText: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Epilogue", size: 16))
            
    }
}

#Preview {
    MediumText(text:"Sample Text")
}
