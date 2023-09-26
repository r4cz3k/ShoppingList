//
//  ListRow.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import SwiftUI

struct ListRow: View {
    
    var itemName: String
    
    var body: some View {
        HStack{
            Text(itemName)
            Spacer()
            
        }
    }
}

#Preview {
    ListRow(itemName: "Apple")
}
