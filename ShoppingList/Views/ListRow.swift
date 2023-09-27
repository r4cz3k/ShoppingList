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
            LazyVGrid(columns: [
                GridItem(spacing: 0),
                GridItem(spacing: 0),
                GridItem(spacing: 0)]){
                    Button{
                        
                    }label:{
                        Image(systemName: "minus")
                            .scaleEffect(0.8)
                            .padding(.all, 3)
                            .tint(.primary).colorInvert()
                    }
                    .background(Circle()
                        .frame(height: 20)
                        .foregroundStyle(.red))
                    Text(String(itemCount))
                    Button{
                        
                    }label:{
                        Image(systemName: "plus")
                            .scaleEffect(0.8)
                            .padding(.all, 3)
                            .tint(.primary).colorInvert()
                    }
                    .background(Circle()
                        .frame(height: 20)
                        .foregroundStyle(.green))

                }
        }
    }
}

#Preview {
    ListRow(itemName: "Apple", itemCount: 4)
}

