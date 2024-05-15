//
//  HeadingText.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct HeadingText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Epilogue", size: 24))
            
    }
}

#Preview {
    HeadingText(text: "Sample Title")
}
