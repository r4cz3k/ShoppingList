//
//  ListManager.swift
//  ShoppingList
//
//  Created by Maciej Rak on 26/09/2023.
//

import Foundation

struct ListManager{
    func removeFromList(_ array: inout [Item], _ indexSet: IndexSet){
        array.remove(atOffsets: indexSet)
    }
    
    func moveInList(_ array: inout [Item], _ indices: IndexSet, _ newOffset: Int){
        array.move(fromOffsets: indices, toOffset: newOffset)
    }
}
