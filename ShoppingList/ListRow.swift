//
//  ListRow.swift
//  ShoppingListCorrect
//
//  Created by Maciej Rak on 05/10/2023.
//

import SwiftUI

struct ListRow: View {
    
    let itemName: String
    let itemCount: Int
    
    var body: some View {
        HStack{
            Text(itemName.capitalized)
                .font(.headline)
            Spacer()
            Text(String(itemCount))
                .font(.subheadline)
                .bold()
        }
    }
}

#Preview {
    ListRow(itemName: "apple", itemCount: 4)
}
