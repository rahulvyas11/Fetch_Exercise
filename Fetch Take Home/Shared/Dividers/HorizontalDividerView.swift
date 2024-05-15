//
//  HorizontalDividerView.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI



struct HorizontalDividerView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(Color.gray)
            .frame(maxWidth: .infinity)
            .frame(height: 0.5)
          
    }
}


#Preview {
    HorizontalDividerView()
}
