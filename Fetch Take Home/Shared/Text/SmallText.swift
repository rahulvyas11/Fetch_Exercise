//
//  SmallText.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct SmallText: View {
    var text: String
    
    var body: some View {
        Text(text)
            .font(.custom("Epilogue", size: 14))
            
    }
}

#Preview {
    SmallText(text:"Small Text")
}
