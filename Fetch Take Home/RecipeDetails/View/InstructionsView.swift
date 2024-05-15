//
//  InstructionsView.swift
//  Fetch Take Home
//
//  Created by Rahul Vyas on 5/14/24.
//

import SwiftUI

struct InstructionsView: View {
    var instructions: String
    
    var formattedInstructions: [(Int, String)] {
            instructions.split(whereSeparator: \.isNewline)
                        .filter { !$0.isEmpty }
                        .enumerated()
                        .map { ($0.offset + 1, String($0.element)) }
        }
        
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                if !(instructions.lowercased().contains("step")) {
                    ForEach(formattedInstructions, id: \.0) { number, line in
                        HStack(alignment: .top, spacing: 2) {
                            MediumText(text:"\(number).")
                                .foregroundColor(Color.red)
                               .bold()
                            MediumText(text:line)
                            }.padding(.bottom, 2)
                    }
                } else {
                    MediumText(text:instructions)
                }
            }
           
        }
        .navigationTitle("Instructions")
    }
    
    
}


#Preview {
    InstructionsView(instructions: """
    Heat oven to 190C/170C fan/gas 5. Tip the flour and sugar into a large bowl. Add the butter, then rub into the flour using your fingertips to make a light breadcrumb texture. Do not overwork it or the crumble will become heavy. Sprinkle the mixture evenly over a baking sheet and bake for 15 mins or until lightly coloured.\\r\\nMeanwhile, for the compote, peel, core and cut the apples into 2cm dice. Put the butter and sugar in a medium saucepan and melt together over a medium heat. Cook for 3 mins until the mixture turns to a light caramel. Stir in the apples and cook for 3 mins. Add the blackberries and cinnamon, and cook for 3 mins more. Cover, remove from the heat, then leave for 2-3 mins to continue cooking in the warmth of the pan.\\r\\nTo serve, spoon the warm fruit into an ovenproof gratin dish, top with the crumble mix, then reheat in the oven for 5-10 mins. Serve with vanilla ice cream.
    """)

}
