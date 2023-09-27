//
//  ListRow.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ListRow: View {
    
    var itemName: String
    var itemCount: Int
    
    var body: some View {
        HStack{
            Text(itemName)
            Spacer()
            Text(String(itemCount))
        }
    }
}

#Preview {
    ListRow(itemName: "Apple", itemCount: 4)
}

